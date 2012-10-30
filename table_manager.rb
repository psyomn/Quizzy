require_relative 'database_registry.rb'
require_relative 'database_commands/update_to_version_000.rb'

# This will take care of updating the table when version 
# are changed on the application. 
#Author::Simon Symeonidis
class TableManager

  def self.run 
    table_version = -1 

    unless DatabaseRegistry.instance.table_exists? (StaticData::VERSION_HISTORY_TABLE_NAME)
      table_version = 0
    end 

    if -1 == table_version 
      exit
    end
    
    if 0 == table_version
      $stderr.puts "Version 0: Create initial tables"
      UpdateToVersion000Command.new(nil).execute 
    end 

    if 1 == table_version
    end 
  end 

end 

