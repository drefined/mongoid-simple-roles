require 'spec_helper'

class User
  include Mongoid::Document
  include Mongoid::Document::Roleable
  field :name
end

describe "A Roleable model" do
  let(:user) { User.new(name: 'Drefined') }

  it "should have a add_role method" do
    user.should respond_to :add_role
  end

  it "should have a has_role? method" do
    user.should respond_to :has_role?
  end

  it "should have a remove_role method" do
    user.should respond_to :remove_role
  end

  it "should be able to add a role" do
    role = "superadmin"
    user.add_role(role)
    user.has_role?(role).should be true
  end

  it "should be able to remove a role" do
    role = "superadmin"
    user.add_role(role)
    user.remove_role(role)
    user.has_role?(role).should_not be true
  end

  it "should be able to call add_role multiple times" do
    user.add_role('admin')
    user.add_role('user')
    user.roles.count.should be 2
  end

  it "should only contain unique roles" do
    user.add_role('superadmin')
    user.add_role('superadmin')
    user.roles.count.should be 1
  end
end

describe "A Roleable model with roles assigned" do
  before(:each) do
    @user = User.create(name: 'Drefined', with_roles: ['superadmin', 'admin', 'user'])
  end

  it "should be able to find_roles" do
    User.find_roles('superadmin').first.should eq(@user)
    User.find_roles(['superadmin', 'admin']).first.should eq(@user)
  end

  it "should be able to find_roles objects if more than one object is present" do
    user_2 = User.create!(name: 'Quicksorter', roles: 'admin')

    users_with_roles = User.find_roles('admin')
    users_with_roles.include?(@user).should be true
    users_with_roles.include?(user_2).should be true
  end
end
