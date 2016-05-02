require_relative "commands"

module Computer

  class PC

  	def enter
	    puts "This scene is not yet configured. Subclass it and implement enter()."
	    exit(1)
    end

    def welcome_message
      puts ""
  		puts "Connecting to #{@pcname}...\nplease wait"
  		sleep(2) #Add a fake loading timer
  		puts ""
    end

    def display_menu
      puts ""
      puts "Type: help, to view available commands"
      puts ""
    end

  end

  class MyPC < PC

  	def initialize
  		@pcname = "hackOS"
  		puts "First enter your name:"
  		@name = gets.chomp
  	end

  	def enter
      welcome_message
      puts "Welcome #{@name}"
      puts ""
  		puts "-= Don't forget the rules of hacking! =-\n-= Scanning, Gaining Access, Covering your tracks. =-"

  		endLoop = 0
  		while endLoop == 0
  			return 'completed' if (TargetCommands.getCompleted == 1) #If he sends the file and erase the logs
  			display_menu
  			print "root@#{@pcname}:#/ "
        return choose_option
      end
    end

    def choose_option
      option = gets.chomp
      case option
        when "help" then MyPcCommands.help
        when "commands" then MyPcCommands.commands
        when "emails" then MyPcCommands.emails
        when "connect server21.contoso.com 21" then 'target';
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

  class Completed < PC
  	def enter
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
  			welcome_message
  			endLoop2 = 0
  			while endLoop2 < 3 #3 tries for a password
  				puts "Enter password to login:"
  				pass = gets.chomp
  				if pass == TargetCommands::PASSWORD
  					puts ""
  					puts "Welcome Admin"
  					endLoop = 0
  					while endLoop == 0
  						display_menu
  						print "root@#{@pcname}:#/#{TargetCommands.get}:"
              choose_option
  					end
  				else
  					puts ""
  					puts "Wrong password. try again, you have #{3 - endLoop2 += 1} tries left."
  				end
  			end
  			return 'mypc'
  		end
  	end

    def choose_option
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

  end

end
