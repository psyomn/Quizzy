require_relative 'database_registry.rb'

# The question table gateway
# Author::Simon Symeonidis
class QuestionTDG

  @@insert_sql   = "" 
  @@update_sql   = ""
  @@delete_sql   = "" 
  @@find_sql     = "SELECT * FROM questions WHERE id=?;"
  @@find_all_sql = "SELECT * FROM questions;"

  def self.insert(question)
  end 

  def self.update(question)
  end 

  def self.delete(question)
  end 

  def self.find(id)
  end 

  def self.find_all
  end 
end 

