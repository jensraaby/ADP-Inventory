class LdImport
  require 'csv'
  
  # table-less model - just use a few helpers needed for validations:
  
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  
  # This lets us access the spreadsheet field as with an ActiveRecord model
  attr_accessor :spreadsheet
  
  validates_presence_of :spreadsheet 
  validate :process_file #custom validator
  
  
  # called when creating an instance with input parameters
  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end
  
  # indicates that this object is not saved anywhere
  def persisted?
    false
  end
  
  
  def machine_hash(headers,rows)
    # This is just to give a nice data structure (a hash of )
    rows.each_with_index.map do |row, index|
      # todo - rearrange the hash so it is sorted - do we need the row index?
      Hash[headers.each_with_index.map { |header, pos| 
        [header, row[pos] ]}
      ].merge('row' => index+2)
    end
  end
  
  def do_it(spreadsheet_path)
    if File.size(spreadsheet_path) == 0 or !FileTest.exist?(spreadsheet_path)
      logger.error("ImportLDWorker: The supplied file was empty or does not exist") 
    else
      
      puts spreadsheet_path
      # run it all in a transaction!
      # either all or nothing!
      ActiveRecord::Base.transaction do
        logger.info("Beginning Import LD operation")
        
        # Just going to make an array of arrays from the CSV
        # The first row is assumed to be the header row with field names
        data = CSV.read(spreadsheet_path)
        headers = data.shift
        
          puts machine_hash(headers,data)
          
          
          
        data.each do  |lditem|
          # we have an array representing an item
           
          
          
        end
      end
      
    end
  end
  
  
  # Custom validation method. Adds errors with helpful text
  def process_file
    unless spreadsheet.blank?
     
      if spreadsheet.size == 0
        errors.add(:spreadsheet, "was empty!")
      else
        if /^.*\.csv$/.match(spreadsheet.original_filename)
          # logger.info("Sending CSV data to asynchronous task")
          # ImportldWorker.perform_async(CSV.parse(spreadsheet.read))
          errors.add(:spreadsheet,"temporary error")
          do_it(spreadsheet.original_filename)
        else
          
          errors.add(:spreadsheet, "The supplied file was not a .CSV file")
          
        end
      end
    else
      errors.add(:spreadsheet, "must be supplied")
    end
    
  rescue CSV::MalformedCSVError
    errors.add(:spreadsheet, "was an invalid CSV file - check it can open with Excel or similar")
  end
  
end