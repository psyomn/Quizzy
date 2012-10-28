require 'singleton' 
require 'sqlite3' 

# The database registry
#Author::Simon Symeonidis 
class DatabaseRegistry

  include Singleton

  # The database handle (in our case, the sqlite3 database) 
  attr_reader :database_handle

  def initialize
    @database_handle = nil 
  end  

  # This can be used for queries that return stuff and those
  def execute(sql)
  end 

end 

