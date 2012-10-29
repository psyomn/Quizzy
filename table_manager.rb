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

    unless DatabaseRegistry.instance.table_exists? (StaticData::VERSION_HISTORY_TABLE_NAME)
      table_version = 0
    end 

    if -1 == table_version 
      log.fatal "There has been an error determining the database information."
      exit
    end
    
    if 0 == table_version
      log.info "Fresh Database, create tables"
      update_to_version_0
    end 

    if :"1" == table_version
      log.info "Updated tables to version 1"
    end 

  end 

private

  # Create tables (version 0 always create tables)
  def self.update_to_version_0
    create_question_sql =\
      "CREATE TABLE questions ("\
      + "id INTEGER PRIMARY KEY"\
      + ", question_text TEXT "\
      + ", correct_answer_id INTEGER); "\
    
    create_answer_sql =\
      "CREATE TABLE answers ("\
      + "id INTEGER PRIMARY KEY "\
      + ", answer_text TEXT);"
            
    create_table_manager_sql =\
      "CREATE TABLE "\
      + StaticData::VERSION_HISTORY_TABLE_NAME\
      + "("\
      + "version TEXT"\
      + ", update_date INTEGER);"

    insert_version_zero_sql =\
      "INSERT INTO "\
      + StaticData::VERSION_HISTORY_TABLE_NAME\
      + " (version,update_date)"\
      + " VALUES "\
      + " ('0',#{Time.now.to_i});"

    DatabaseRegistry.instance.execute(create_question_sql)
    DatabaseRegistry.instance.execute(create_answer_sql)
    DatabaseRegistry.instance.execute(create_table_manager_sql)
    DatabaseRegistry.instance.execute(insert_version_zero_sql)
  end 

  def self.update_to_version_1
  end 

  def self.update_to_version_2
  end 

end 

