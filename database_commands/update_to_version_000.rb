require_relative 'database_command.rb'
require_relative '../database_registry.rb'
require_relative '../static_data.rb'

# Update the database to version 0 
# Version 0 by our set definition means that the first
# initial tables and setup is performed in this command. 
# author::Simon Symeonidis 
class UpdateToVersion000Command < DatabaseCommand

  def initialize(params)
    super(params)
  end 

  def execute
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
      + "version INTEGER"\
      + ", update_date INTEGER);"

    insert_version_zero_sql =\
      "INSERT INTO "\
      + StaticData::VERSION_HISTORY_TABLE_NAME\
      + " (version,update_date)"\
      + " VALUES "\
      + " (0,#{Time.now.to_i});"

    DatabaseRegistry.instance.execute(create_question_sql)
    DatabaseRegistry.instance.execute(create_answer_sql)
    DatabaseRegistry.instance.execute(create_table_manager_sql)
    DatabaseRegistry.instance.execute(insert_version_zero_sql)
  end 

end 
