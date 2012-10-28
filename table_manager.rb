require 'logger'
require_relative 'database_registry.rb'

# This will take care of updating the table when version 
# are changed on the application. 
# Author::Simon Symeonidis
class TableManager

  def self.run 
    log = Logger.new(STDERR)
    log.level = Logger::INFO
    table_version = -1 

    # TODO database checkup needs to happen here 

    if -1 == table_version 
      log.fatal "There has been an error determining the database information."
    end
    
    if :"0" == table_version
      log.info "Fresh Database, create tables"
    end 

    if :"1" == table_version
      log.info "Updated tables to version 1"
    end 

    if :"2" == table_version
      log.info "Updated tables to version 2"
    end 

    if :"3" == table_version
      log.info "Updated tables to version 3"
    end 

    if :"4" == table_version
      log.info "Updated tables to version 4"
    end 

  end 

end 

