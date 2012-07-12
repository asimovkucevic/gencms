require 'spec_helper'

describe User do
  before(:each) do
  	@u = Factory(:user)
  end

  it "can make a User from the Factory." do
    @u.should_not be_nil
    @u.should be_kind_of(User)
  end

  it "must have a email" do
    b = User.new(:password => @u.password)  # => works also with create. Validations are executed before data is entered in database.
    b.should_not be_valid # => calls b.valid?
    b.errors.include?(:email).should_not be_nil
  end

  it "must have a password" do
    b = User.new(:email => @u.email ) #"joe@gmail.com")
    b.should_not be_valid
    b.errors.include?(:password).should_not be_nil    
  end

  it "creates an instance of User object" do
  	lambda {
  		User.create!( { :email => "joey@gmail.com", :password => @u.password } )
    }.should change { User.count }.by(1)    
  end

end
