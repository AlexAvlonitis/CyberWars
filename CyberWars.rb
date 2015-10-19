require "./assets/modules/Commands.rb"


class PC

	def initialize(pcname, name)
		@pcname = pcname
		@name = name
	end

	def enter
		puts "#{@pcname} is booting up...\nplease wait"
		sleep(3) #Add a booting up illusion
		puts "Welcome #{@name}"
	end

end

class MyPC < PC

	def initialize(pcname, name)
		super(pcname,name)		
	end

	def subcommands
		endLoop = 0 
		while endLoop == 0
			puts "Type: help, to view available commands"
			print "root@#{@pcname}:#/ "
			option = gets.chomp
			case option
				when "help" then Commands.help 
				when "commands" then Commands.commands 
			    when "emails" then Commands.emails
			    when "portscan server21.contoso.com" then Commands.portscan
			    when "portscan" then puts "You haven't specified a host!"
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

class Target < PC
	def initialize(pcname, name)
		super(pcname,name)		
	end
end




mypc = MyPC.new(pcname="hackOS",name="Alex")

mypc.enter
mypc.subcommands