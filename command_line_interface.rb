require_relative 'static_data.rb'
require_relative 'commands/insert_question_command.rb'
require_relative 'commands/make_quiz_command.rb'

# The command line interface that takes care of 
class CommandLineInterface

  def run
    cmd = "default" 

    while cmd != "quit" 
      print "quiz::"
      cmd = $stdin.gets.strip
      case cmd 

      when "quiz"
        make_quiz
      
      when "insert"
        insert_question

      when "info"
        info 

      when "help"
        help

      end 
    end 
  end 

private 

  # These are the commands, along with descriptions to aid
  # the user when in need.
  @@commands = [
    ["quiz", "Make a multiple choice quiz by retrieving information from the current database"],
    ["insert", "Inster a question and answer into the database"],
    ["info", "Information about this application"],
    ["help", "Show this information"],
    ["quit", "Exit the application"]
  ]

  # Print information about the narcissist author.
  def info
    puts "Version #{StaticData::APPLICATION_VERSION}"
    puts "Authors : "
    StaticData::AUTHORS.each do |author| 
      puts "-- #{author}"
    end 
  end 

  # Insert a question into the database 
  def insert_question
    print "Question text : "
    question_str = $stdin.gets.strip
    print "Answer text : " 
    answer_str   = $stdin.gets.strip
    InsertQuestionCommand.new([question_str,answer_str]).execute
  end 

  # Make a quiz from the currently stored questions in
  # the database
  def make_quiz
    MakeQuizCommand.new(nil).execute
  end

  # Print the available actions to the user
  def help
    @@commands.each do |command| 
      puts command[0]
      puts "  `#{command[1]}"
    end 
  end

end 
