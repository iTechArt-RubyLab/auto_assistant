class MyWorkerJob < ApplicationJob
  @queue = :my_queue

  def perform
    # Define the work to be performed by the worker here
    sleep(5)
    puts "Performing work with arguments"
  end
end