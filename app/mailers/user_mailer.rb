class UserMailer < ApplicationMailer
  def expiry_warning(user)
    @user = user
    mail(to: user.email, subject: "Expiry Warning")
  end
end

