require_relative 'static_data.rb'
require_relative 'commands/insert_question_command.rb'

# The command line interface that takes care of 
class CommandLineInterface

  def run
    cmd = "default" 

    while cmd != "quit"
      cmd = $stdin.gets.strip
      case cmd 

      when "quiz"
      
      when "insert"
        insert_question

      when "info"
         help 

      end 
    end 
  end 

private 

  def help
    puts "Version #{StaticData::APPLICATION_VERSION}"
    puts "Authors : "
    StaticData::AUTHORS.each do |author| 
      puts "-- #{author}"
    end 
  end 

  def insert_question
    print "Question text : "
    question_str = $stdin.gets.strip
    print "Answer text : " 
    answer_str   = $stdin.gets.strip
    InsertQuestionCommand.new([question_str,answer_str]).execute
  end 

end 
