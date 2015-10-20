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
	def initialize(pcname="hackOS", name="Alex")
		@pcname = pcname
		@name = name
	end

	def enter
		puts ""
		puts "Connecting to #{@pcname}...\nplease wait"
		sleep(2) #Add a loading illusion
		puts ""
		puts "Welcome #{@name}"
		puts ""
		puts "-= Remember the three rules! Scan, Gain Access, Cover your tracks. =-"
		endLoop = 0 
		while endLoop == 0
			puts "Type: help, to view available commands"
			puts ""
			print "root@#{@pcname}:#/ "
			option = gets.chomp
			case option
				when "help" then MyPcCommands.help 
				when "commands" then MyPcCommands.commands 
			    when "emails" then MyPcCommands.emails
			    when "connect server21.contoso.com 21" then return 'target' ;
			    when "connect server21.contoso.com 80" then puts "Can't connect, the remote host is either blocking our connection or a service is not running on that port";
			    when "portscan server21.contoso.com 21" then MyPcCommands.portscan ;
			    when "portscan server21.contoso.com 80" then puts "Scan failed, the remote host is either blocking our scan or a service is not running on that port" ;
			    when "bruteforce server21.contoso.com 21" then MyPcCommands.portscan ;
			    when "exit" then exit ;
			else
				puts "Wrong input, try again"
			end
		end
	end
end

class Completed < PC
	def enter()
		true
	end
end

class Target < PC

	def initialize(pcname="server21", name="")
		@pcname = pcname
		@name = name
	end

	def enter
		endLoop = 0 
		while endLoop == 0
			puts ""
			puts "Connecting to #{@pcname}...\nplease wait"
			sleep(2) #Add a loading illusion
			puts ""
			puts "Enter password to login:"
			pass = gets.chomp
			if pass == TargetCommands::PASSWORD
				puts "Welcome Admin"
				endLoop = 0 
				while endLoop == 0
					puts ""
					puts "To list folders, Type: ls"
					puts "To change folder, Type: cd <folder name>, eg. cd folder1"
					puts "To disconnect from the host, Type: disconnect"
					puts ""
					print "root@#{@pcname}:#/ "
					option = gets.chomp
					case option
						when "ls" then TargetCommands.ls ;
						when "cd Myclients" then TargetCommands.cd ;
					    when "cd " then puts "The folder name is case sensitive";
					    when "disconnect" then return 'mypc' ;
					else
						puts ""
						puts "Wrong input, try again"
					end
				end
			else
				puts ""
				puts "Wrong password. disconnecting..."
				return 'mypc'
			end
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





newmap = Map.new('mypc')

newgame = Engine.new(newmap)

newgame.play
