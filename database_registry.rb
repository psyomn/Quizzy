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

  # For prepared statements. Enter the sql along with an array that holds
  # parameters.
  def execute_prepared(sql,params_arr)
    prepared_statement = @database_handle.prepare(sql)
    params_arr.each_with_index do |param,index|
      prepared_statement.bind_param(index+1,param)
    end 
    prepared_statement.execute
  end

  def table_exists?(name)
    val = @database_handle.execute(@@table_exists_sql, "table", name) 
    if 1 == val.flatten[0]
      return true
    else
      return false
    end 
  end

end 

