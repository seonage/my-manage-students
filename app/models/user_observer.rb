class UserObserver < ActiveRecord::Observer
  def after_create(user)
    UserMailer.send_login_information(user.id, user.password).deliver! unless user.admin?
  end
end
