require_relative 'database_command.rb'
require_relative '../database_registry.rb'
require_relative '../static_data.rb'

#  Update to version 1 
# To demonstrate the mechanism, we want to add to the 
# tables 'questions' and 'answers' created_at and updated_at
# dates. The alter table sql queries are done here.
#author::Simon Symeonidis 
class UpdateToVersion001Command < DatabaseCommand

  def initialize(params)
    super(params)
  end 

  def execute
    update_question_add_created_at_sql =\
      "ALTER TABLE questions "\
      + "ADD created_at INTEGER;"\
    
    update_question_add_updated_at_sql =\
      "ALTER TABLE questions "\
      + "ADD updated_at INTEGER;"

    update_answer_created_at_sql =\
      "ALTER TABLE answers "\
      + "ADD created_at INTEGER;"

    update_answer_updated_at_sql =\
      "ALTER TABLE answers "\
      + "ADD updated_at INTEGER;"

    question_changeset = [update_question_add_created_at_sql\
    ,update_question_add_updated_at_sql]

    answer_changeset = [update_answer_created_at_sql\
    ,update_answer_updated_at_sql]

    qa_changeset = question_changeset + answer_changeset
            
    # Add the new version with the timestamp to the db
    insert_version_zero_sql =\
      "INSERT INTO "\
      + StaticData::VERSION_HISTORY_TABLE_NAME\
      + " (version,update_date)"\
      + " VALUES "\
      + " (1,#{Time.now.to_i});"

    qa_changeset.each do |sql| 
      DatabaseRegistry.instance.execute(sql)
    end 

    DatabaseRegistry.instance.execute(insert_version_zero_sql)
  end 

end 
