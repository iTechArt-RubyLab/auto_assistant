class UserMailer < ApplicationMailer
  default from: ""

  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end


  def log_expired_info(user)
    @user = user
    @log = user.car.log
    # check if  any datetime field of log is up to date
    @log.attributes.each do |key, value|
      if value.present? && value < DateTime.now
        @log_expired = true
      end
    end
    if @log_expired
      @url  = 'http://example.com/login'
      mail(to: @user.email, subject: 'Log expired')
    end
    end
end
