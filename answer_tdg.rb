require_relative 'database_registry.rb'

# Answer table data gateway
# Author::Simon Symeonidis
class AnswerTDG

  @@table_name     = "answers"
  @@insert_sql     = "INSERT INTO #{@@table_name} (answer_text) VALUES (?);" 
  @@update_sql     = "UPDATE #{@@table_name} set answer_text=? WHERE id=?;"
  @@delete_sql     = "DELETE FROM #{@@table_name} WHERE id=?" 
  @@find_sql       = "SELECT * FROM #{@@table_name} WHERE id=?;"
  @@find_all_sql   = "SELECT * FROM #{@@table_name};"
  @@last_rowid_sql = "SELECT last_insert_rowid();"

  def self.insert(answer_text)
    DatabaseRegistry
      .instance
      .execute_prepared(@@insert_sql,[answer_text])
    DatabaseRegistry
      .instance
      .execute(@@last_rowid_sql);
  end 

  def self.update(id,answer_text)
    DatabaseRegistry
      .instance
      .execute_prepared(@@update_sql,[answer_text,id])
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
      .execute(@@find_all) 
  end

end 

