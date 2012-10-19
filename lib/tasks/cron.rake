desc "Cron task is called by heroku addon"
task :cron => :environment do
  # task will run at the time the daily cron addon was enabled
  User.find_each do |user|
    user_notifications = user.notifications
    if user_notifications.size > 0
      next if user.email.blank?
      NotificationMailer.upgrades(user, user_notifications).deliver
    end
  end

  Notification.delete_all(["upgraded_at < ?", 2.days.ago])
end
