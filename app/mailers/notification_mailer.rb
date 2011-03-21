class NotificationMailer < ActionMailer::Base
  default :from => "noreply@gemnotifier.org"
  
  def upgrades(user, notifications)
    @user = user
    @notifications = notifications
    mail({
      :to => user.email,
      :subject => "GemNotifier + Updates"
    })
  end
  
end
