class ImportldWorker
  include Sidekiq::Worker
  require 'csv'
  # start this worker using:
  # ImportldWorker.perform_async()


  def machine_hash(headers,rows)
    # This is just to give a nice data structure (a hash of )
    rows.each_with_index.map do |row, index|
      # todo - rearrange the hash so it is sorted - do we need the row index?
      Hash[headers.each_with_index.map { |header, pos| [header, row[pos] ]}].merge('row' => index+2)
    end
  end
  
  
  def process_file(filepath)
    # Start with some error handling!
    if File.size(filepath) == 0 or !FileTest.exist?(filepath)
      logger.error("ImportLDWorker: The supplied file was empty or does not exist") 
    else
      
      
      # run it all in a transaction!
      # either all or nothing!
      ActiveRecord::Base.transaction do
        logger.info("Beginning Import LD operation")
        
        # Just going to make an array of arrays from the CSV
        # The first row is assumed to be the header row with field names
        data = CSV.read(filepath)
        headers = data.shift
        
          puts machine_hash(headers,data)
          
          
          
        data.each do  |lditem|
          # we have an array representing an item
         
          
          
        end
      end
      
    end
  end
  
  def perform(filepath)
    process_file(filepath)
    # logger.info("NOT IMPLEMENTED YET!")
  end
end