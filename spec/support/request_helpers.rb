require 'spec_helper'
include Warden::Test::Helpers

module RequestHelpers
  def create_logged_in_admin
    @user ||= User.create(name: 'Test', email: 'test@test.com', password: '12341234', password_confirmation: '12341234', admin: true)
    login_as @user, scope: :user
    @user
  end

  def create_logged_in_user
    @user ||= User.create(name: 'Test', email: 'test1@test.com')
    login_as @user, scope: :user
    @user
  end
end