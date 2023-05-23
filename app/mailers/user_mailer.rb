class UserMailer < ApplicationMailer

  def log_in_gritting
    mail(
      to: "pashasha1212@mail.ru",
      subject: "You logged in successfully!"

    )
  end
  def expiry_warning(user)
    @user = user
    mail(to: user.email, subject: "Expiry Warning")
  end
end

