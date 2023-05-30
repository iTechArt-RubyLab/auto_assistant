class SecondWorker < ApplicationJob
  @queue = :my_queue

  def perform
    # Define the work to be performed by the worker here
    sleep(10000)
    puts "Dddsfsghtrjjhdhdh"
  end
end