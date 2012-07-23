ActiveAdmin.register User do
  index do
    column :email
	  default_actions
  end

  member_action :roles do
    # => @user = User.find(params[:id].to_i)
		# => role = Role.find_or_create_by_name('productAdmin', :created_by => params[:id].to_i)
		# => @user.roles << role
 	  # => redirect_to :action => :index	# => , :notice => "Inserted!"
  end

  member_action :roles_update do

  end  
 
# => /admin/users/:id/Tests
# => /admin/users/:id/roles_update

  form do |f|
    f.inputs "User Details" do
      	f.input :email
#        if f.object.new_record?
        f.input :password
        f.input :password_confirmation          
 #       end
        f.input :roles, as: :check_boxes      
    end
    f.buttons
  end  

  member_action :edit do
    # user = User.find(params[:id].to_i)
    # adminUser = AdminUser.create( :email => user.email, :encrypted_password => user.encrypted_password )
  end

#  member_action :create, :method => :post do
#    user = User.find(params[:id].to_i)
#      if :roles == 1
#      User.test_user(:email.to_s, :password.to_s, :password_confirmation.to_s)
#        AdminUser.create( AdminUser.email => "novi@mail.com", AdminUser.password => "123456" )
#      end
#     redirect_to  "/admin/users"  #{}"/admin/users" #+ user.id.to_s   #:action => :admin_users  # => , :notice => "Inserted!"    
#  end






end
