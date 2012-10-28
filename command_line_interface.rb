require_relative 'static_data.rb'

# The command line interface that takes care of 
class CommandLineInterface

  def run
    cmd = "default" 

    while cmd != "quit"
      cmd = $stdin.gets.strip
      case cmd 

      when "quiz"
      
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

end 
