require 'spec_helper'

describe User do
  before(:each) do
    @u = FactoryGirl.build(:user)
  end

  it "can make a User from the Factory." do
    @u.should_not be_nil
    @u.should be_kind_of(User)
  end

  it "must have a email" do
    b = User.new(:password => @u.password)
    b.should_not be_valid # => calls b.valid?
    b.errors.include?(:email).should_not be_nil
  end

  it "must have a password" do
    b = User.new(:email => @u.email )
    b.should_not be_valid
    b.errors.include?(:password).should_not be_nil
  end

  it "creates an instance of User object" do
    lambda {
      User.create!( { :email => "joey@gmail.com", :password => @u.password } )
    }.should change { User.count }.by(1)
  end

  describe "Associations" do
    it "has authentications" do
      User.new.should respond_to(:authentications)
    end
  end
end
