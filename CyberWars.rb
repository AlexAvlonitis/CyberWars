require "./assets/modules/Commands.rb"

class MainPC
	def enter()
		puts "HackOS is booting up...\nplease wait"
		sleep(3) #Add a booting up illusion
		puts "Enter your name to start:"
		@name = gets.chomp
		puts "Welcome #{@name}"
		endLoop = 0 
		while endLoop == 0
			puts "Type: help, to view available commands"
			print "root@HackOS:#/ "
			option = gets.chomp
			case option
				when "help" then Commands.help 
				when "commands" then Commands.commands 
			    when "emails" then Commands.emails 
			    when "exit" then exit 
			else
				puts "Wrong input, try again"
			end
		end
	end
end

class Missions
	def enter()

	end
end

class Proxies
	def enter()

	end
end

class Emails
	def enter()

	end
end




start = MainPC.new

start.enter