class NotificationMailer < ActionMailer::Base
  default :from => "admin@intridea.com"
  
  def upgrades(user, notifications)
    @user = user
    @notifications = notifications
    mail({
      :to => user.email,
      :subject => "GemNotifier + Updates"
    })
  end
  
end
