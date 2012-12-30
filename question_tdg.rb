require_relative 'database_registry.rb'

# The question table gateway
# Author::Simon Symeonidis
class QuestionTDG

  @@table_name   = "questions"
  @@insert_sql   = "INSERT INTO #{@@table_name} (question_text,correct_answer_id) VALUES (?,?);" 
  @@update_sql   = "UPDATE #{@@table_name} set question_text=?, correct_answer_id=? WHERE id=?;"
  @@delete_sql   = "DELETE FROM #{@@table_name} WHERE id=?" 
  @@find_sql     = "SELECT * FROM #{@@table_name} WHERE id=?;"
  @@find_all_sql = "SELECT * FROM #{@@table_name};"

  def self.insert(question_text,answer_id)
    DatabaseRegistry
      .instance
      .execute_prepared(@@insert_sql,[question_text,answer_id])
  end 

  def self.update(id,question_text,answer_id)
    DatabaseRegistry
      .instance
      .execute_prepared(@@update_sql,[question_text,answer_id,id])
  end 

  def self.delete(id)
    DatabaseRegistry
      .instance
      .execute_prepared(@@delete_sql,[id])
  end 

  def self.find(id)
    DatabaseRegistry
      .instance
      .execute_prepared(@@find_sql,[id])
  end 

  def self.find_all
    DatabaseRegistry
      .instance
      .execute(@@find_all_sql) 
  end 
end 

