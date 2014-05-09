# encoding: UTF-8
class UserMailer < ActionMailer::Base
  default from: 'srknyavuz86@gmail.com'

  def send_login_information(user_id, password)
    @user = User.find(user_id)
    @password = password
    mail(to: @user.email, subject: 'Montclair Login Information')
  end
end
