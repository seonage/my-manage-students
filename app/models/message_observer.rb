class MessageObserver < ActiveRecord::Observer
  def after_create(message)
    MessageMailer.send_mail(message.id).deliver!
  end
end
