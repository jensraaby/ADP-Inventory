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
  
  
  # Custom validation method. Adds errors with helpful text
  def process_file
    unless spreadsheet.blank?
      
      if spreadsheet.size == 0
        errors.add(:spreadsheet, "was empty!")
      else
        if /^.*\.csv$/.match(spreadsheet.original_filename)
          logger.info("Sending CSV data to asynchronous task")
          # ImportldWorker.perform_async(CSV.parse(spreadsheet.read))
          
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