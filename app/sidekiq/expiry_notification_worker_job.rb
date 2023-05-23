class ExpiryNotificationWorkerJob
  include Sidekiq::Job

  def perform(log_id)
    log = Log.find(log_id)
    user = log.car.user

    months_until_insurance_expiry = (log.ensuranse_expiration.to_date.year * 12 + log.ensuranse_expiration.to_date.month) - (Time.current.year * 12 + Time.current.month)
    months_until_license_expiry = (log.driver_lisence_expiration.to_date.year * 12 + log.driver_lisence_expiration.to_date.month) - (Time.current.year * 12 + Time.current.month)

    if months_until_insurance_expiry == 1 || months_until_license_expiry == 1
      UserMailer.expiry_warning(user).deliver_now
    end
  end
end
