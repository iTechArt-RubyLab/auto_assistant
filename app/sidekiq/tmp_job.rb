class TmpJob
  include Sidekiq::Job

  def perform(*args)
    puts "Congrats sidekiq is working"
  end
end
