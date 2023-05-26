class NotificationJob
  @queue = :notifications

  def self.perform(user_id, work_id)
    user = User.find(user_id)
    work = Work.find(work_id)

    if work.next_appointment - 1.month <= Time.current
      UserMailer.notification_email(user, work).deliver_now
    end
  end
end
