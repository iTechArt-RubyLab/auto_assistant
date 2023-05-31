class LogJob
  @queue = :notifications

  def self.perform(user_id)
    user = User.find(user_id)
    user.cars.each do |car|
      if car.log.present?
        log = car.log

        log.attributes.each do |attr, value|
          if value.is_a?(DateTime) && value.day == 1 && value.hour == 0 && value.min == 0 && value.sec == 0
            UserMailer.log_email(user, log, attr)
          end
        end
      end
    end
  end
end

