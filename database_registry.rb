require 'singleton' 
require 'sqlite3' 
require_relative 'static_data.rb'

# The database registry
#Author::Simon Symeonidis 
class DatabaseRegistry

  include Singleton

  @@table_exists_sql = "SELECT COUNT(type) from sqlite_master where type=? and name=?"

  # The database handle (in our case, the sqlite3 database) 
  attr_reader :database_handle

  def initialize
    @database_handle = SQLite3::Database.new StaticData::DATABASE_NAME
  end  

  # This can be used for queries that return stuff and those
  def execute(sql)
    @database_handle.execute(sql)
  end 

  def table_exists?(name)
    if 1 == @database_handle.execute(@@table_exists_sql, "table", name)
      true
    else
      false
    end 
  end

end 

