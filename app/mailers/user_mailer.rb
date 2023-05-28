class UserMailer < ActionMailer::Base
  default from: 'auto_assistant@auto.com'

  def notification_email(user, work)
    @user = user
    @work = work
    mail(to: @user.email, subject: "it's just 1 one left before your next appointment")
  end

  def log_email(user, log, attr)
    @user = user
    @log = log
    @attr = attr

    mail(to: user.email, subject: 'Notification: Month-only DateTime field detected')
  end
end
