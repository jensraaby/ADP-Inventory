class UsersyncWorker
  include Sidekiq::Worker
  
  # start this worker using:
  # UsersyncWorker.perform_async()
  
  def perform()
    # do something
      logger.info("NOT IMPLEMENTED YET!")
  end
end