class User < ActiveRecord::Base
  attr_accessible :email, :hashed_password, :name
end
