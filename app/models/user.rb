class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :role_ids
  # attr_accessible :title, :body
  	has_many :authentications
    has_and_belongs_to_many :roles    

    before_save :save_as_admin

  	def apply_omniauth(omniauth)
     self.email =  omniauth['info']['email'] if email.blank?          
  		authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'])
    end

  	def password_required?
  		(authentications.empty? || !password.blank?) && super
  	end

  def role?(role)
#      return !!self.roles.find_by_name(role.to_s.camelize)
      return !!self.roles.find_by_name(role)
  end
    
  def self.test_user(email, password, password_confirmation)
    self.create!( :email => email, :password => password, :password_confirmation => password_confirmation )
  end

  private

  def save_as_admin

    if self.role_ids.first == 1
        AdminUser.create!( :email => email, :password => password, :password_confirmation => password_confirmation )        
    else
      user1 = User.all(:include => :roles, :conditions => [" users.id = ? ", self.id.to_i ])
      adminUser = AdminUser.where([" email = ? ", user1[0].email.to_s]).first unless user1[0].blank?
      AdminUser.destroy(adminUser.id)  unless adminUser.blank?
    end    
  end
end
