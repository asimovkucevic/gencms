class Table < ActiveRecord::Base
  has_many :columns, :dependent => :destroy
  attr_accessible :table_name, :table_desc
  validates_presence_of :table_name	# => , :on => :create  
  validates_presence_of :table_desc
end
