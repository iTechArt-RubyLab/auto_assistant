class UserMailer < ActionMailer::Base
  default from: 'auto_assistant@auto.com'

  def notification_email(user, work)
    @user = user
    @work = work
    mail(to: @user.email, subject: "it's just 1 one left before your next appointment")
  end
end
