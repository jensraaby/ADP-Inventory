class Workstation < ActiveRecord::Base  
  attr_accessible :serial, :OS, :information, :model, :name
  
  store :information, accessors: [ :last_seen, :primary_user_id ]
  
  # This lets you assign the workstation in a registration:
  has_many :registrations, :as => :device
  
  has_paper_trail
  
  
  def machine_hash(headers,rows)
    # This is just to give a nice data structure (a hash of )
    rows.each_with_index.map do |row, index|
      # todo - rearrange the hash so it is sorted - do we need the row index?
      Hash[headers.each_with_index.map { |header, pos| 
        [header, row[pos] ]}
      ].merge('row' => index+2)
    end
  end
  
  
  # Class method for importing a Landesk CSV

  def self.import(file)
    filedata = file.read
    lines = []
    IO.foreach(file.path) do |line|
      lines << line
    end
    # For some reason I get a quote error for the first line
    lines[0] = lines[0].delete('"')
    
    # Now swap the column headers for my mappings
    mappings = {}
    mappings['Device Name'] = "name"
    mappings['OS Name'] = "OS"
    mappings['Board Name'] = "model"
    mappings['Serial Number'] = "serial"
    
    
    headers = lines.first
    mappings.each do |orig,rep|
      headers.gsub!(/#{orig}/, rep)
    end
    
    lines[0] = headers
    
    # This gives us a hash from column name to data for each row
    data = CSV.parse(lines.join, headers: true)
    
  
    ActiveRecord::Base.transaction do
      logger.info("Beginning Import of workstations")
      
      data.each do |machine|
        serial = machine["serial"]
        ws = find_by_serial(serial) || new
        
        ws.attributes = machine.to_hash.slice(*accessible_attributes)
        #TODO: work out why I can't just query the string
        ws.name= machine[machine.to_hash.keys.first]
        
        # ws.primary_user_id
        ws.save!
      end

    end
  rescue CSV::MalformedCSVError
    debugger
  end
end
