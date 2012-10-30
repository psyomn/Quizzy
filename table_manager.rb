require_relative 'database_registry.rb'
require_relative 'database_commands/update_to_version_000.rb'
require_relative 'database_commands/update_to_version_001.rb'

# This will take care of updating the table when version 
# are changed on the application. 
#Author::Simon Symeonidis
class TableManager

  @@get_schema_version_sql =\
    "SELECT version FROM table_version_history;"
 
  def self.run 
    table_version = -1 

    unless DatabaseRegistry.instance.table_exists? (StaticData::VERSION_HISTORY_TABLE_NAME)
      table_version = 0
    else 
      versions = DatabaseRegistry
        .instance
        .execute(@@get_schema_version_sql)
      versions.flatten!
      table_version = versions.max + 1
    end 

    if -1 == table_version 
      $stderr.puts "Error in table manager: something horrible happened" 
      exit
    end
    
    if 0 == table_version
      $stderr.puts "Version 0: Create initial tables"
      UpdateToVersion000Command.new(nil).execute 
      table_version = 1 # we continue to next update
    end 

    if 1 == table_version
      $stderr.puts "Version 1: Adding timestamps to tables "
      UpdateToVersion001Command.new(nil).execute 
      table_version = 2
    end 

    if 2 == table_version
      $stderr.puts "Database is up to date."
    end 
  end 

end 

