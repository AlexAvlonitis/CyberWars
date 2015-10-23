require "./assets/modules/Commands.rb"

class PC
	def enter()
	    puts "This scene is not yet configured. Subclass it and implement enter()."
	    exit(1)
    end
end

class Engine
  def initialize(scene_map)
    @scene_map = scene_map
  end

  def play()
    current_scene = @scene_map.opening_scene
    last_scene = @scene_map.next_scene('completed')

    while current_scene != last_scene
	    next_scene_name = current_scene.enter
	    current_scene = @scene_map.next_scene(next_scene_name)
	end

    current_scene.enter
  end  
end


class MyPC < PC
	def initialize(pcname="hackOS", name="Anonymous")
		@pcname = pcname
		@name = name
	end

	def enter
		puts ""
		puts "Connecting to #{@pcname}...\nplease wait"
		sleep(2) #Add a fake loading timer
		puts ""
		puts "Welcome #{@name}"
		puts ""
		puts "-= Don't forget the rules of hacking! =-\n-= Scanning, Gaining Access, Covering your tracks. =-"

		endLoop = 0 
		while endLoop == 0
			return 'completed' if (TargetCommands.getCompleted == 1) #If he sends the file and erase the logs
			puts "Type: help, to view available commands"
			puts ""
			print "root@#{@pcname}:#/ "
			option = gets.chomp
			case option
				when "help" then MyPcCommands.help 
				when "commands" then MyPcCommands.commands 
			    when "emails" then MyPcCommands.emails
			    when "connect server21.contoso.com 21" then return 'target' ;
			    when "connect server21.contoso.com 80" then puts "\nCan't connect, the remote host is either blocking the connection or a service is not running on that port";
			    when "portscan server21.contoso.com" then MyPcCommands.portscan ;
			    when "portscan" then puts "\nYou haven't specified a host" ;
			    when "bruteforce server21.contoso.com 21" then MyPcCommands.bruteforce ;
			    when "bruteforce server21.contoso.com 80" then puts "\nBruteForcing failed, the remote host is either blocking the scan or a service is not running on that port" ;
			    when "exit" then exit ;
			else
				puts "Wrong input, try again"
			end
		end

	end
end

class Completed < PC
	def enter()
		puts ""
		puts "--==|| CONGRATULATIONS YOUR FINISHED YOUR MISSION ||==--"
		sleep(2)
		exit
	end
end

class Target < PC

	def initialize(pcname="server21")
		@pcname = pcname
	end

	def enter
		endLoop = 0 
		while endLoop == 0
			puts ""
			puts "Connecting to #{@pcname}...\nplease wait"
			sleep(2) #Add a fake loading timer
			puts ""

			endLoop2 = 0
			while endLoop2 < 3 #3 tries for a password
				puts "Enter password to login:"
				pass = gets.chomp			
				if pass == TargetCommands::PASSWORD
					puts ""
					puts "Welcome Admin"
					endLoop = 0 
					while endLoop == 0
						puts ""
						puts "Type: help, to view available commands"
						puts ""
						print "root@#{@pcname}:#/#{TargetCommands.get}:"
						option = gets.chomp
						case option
							when "help" then TargetCommands.help ;
							when "ls" then TargetCommands.ls ;
							when "cd Myclients" then TargetCommands.cdMyclients ;
							when "cd funny_pictures" then TargetCommands.cdFunnyPictures ;
							when "cd.." then TargetCommands.cdBack ;
							when "cat client_personal_details.xlsx" then TargetCommands.cat ;
							when "cat" then puts "You haven't specified a filename";
							when "cryptosend client_personal_details.xlsx hackOS" then TargetCommands.cryptosend ;
							when "cryptosend client_personal_details.xlsx" then puts "You haven't specified a host" ;
							when "cryptosend" then puts "You haven't specified a filename" ;
							when "./eraseLogs.script" then TargetCommands.eraseLogs ;
						    when "cd" then puts "Note! The folder name is case sensitive";
						    when "disconnect" then return 'mypc' ;
						else
							puts ""
							puts "Wrong input, try again"
						end
					end
				else
					puts ""
					puts "Wrong password. try again, you have #{3 - endLoop2 += 1} tries left."					
				end
			end

			return 'mypc'
		end
	end
end

class Map

	@@scenes = {
		'mypc' => MyPC.new,
		'target' => Target.new,
		'completed' => Completed.new
	}

	def initialize(place)
		@place = place
	end

	def next_scene(nextscene)
		@@scenes[nextscene]
	end

	def opening_scene
		return next_scene(@place)
	end
end