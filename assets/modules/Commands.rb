module MyPcCommands
	def self.help
		puts ""
		puts "(1) To see all the available commands, type: commands"
		puts "(2) To view your emails, type: emails"
		puts "(3) To exit, type: exit"
		puts ""
	end	

	def self.commands
		puts ""
		puts "(1)To find open ports of a remote host,\nType: portscan <hostname Or Ip of the target>, eg. portscan 32.134.12.3"
		puts ""
		puts "(2)To connect to a remote server,\nType: connect <hostname or IP> <port number>, eg. connect 32.2.13.4 1234"
		puts ""
		puts "(3)To Brute Force a service,\nType: bruteforce <hostname or IP> <port number>, eg. bruteforce 32.2.13.4 1234"
		puts ""
	end

	def self.portscan
		puts ""
		puts "Scanning..."
		sleep(2)
		puts "open ports:"
		puts "-21 ftp"
		puts "-80 http filtered"
		puts ""
	end

	def self.bruteforce
		puts ""
		puts "Bruteforcing server21.contoso.com, this might take a while..."
		puts ""
		(1..10).each do 
			puts (0...50).map { ('a'..'z').to_a[rand(26)] }.join
			sleep(1)
		end
		puts "Password cracked!:"
		puts TargetCommands::PASSWORD
		puts ""
	end

	def self.emails
		puts ""
		puts "-=Welcome to CryptoMailer service. You have a new message=-"
		puts ""
		puts "-From: Secret Client-31"
		puts "-Subject: Need Cash?"
		puts "-Body: Hello,\nI've heard you are one of the best in the field, that's why i want to offer you a job."
		puts "I will need you to break into this server: server21.contoso.com,"
		puts "find their customer details and send them back to me.\nI trust your skills and your payment will be 5000$."
		puts ""
	end
end

module TargetCommands

	@@folder = ""

	def self.get
    	@@folder
  	end

	def self.cdBack
		if (@@folder == "") || (@@folder == "Myclients")  || (@@folder == "funny_pictures") 
			puts @@folder = ""
		else 
			puts "something went wrong"
		end			
	end

	def self.ls
		if @@folder == ""
			puts ""
			puts "Name: Myclients    Type: Folder     Size: 5k   Date_Modified: 03/08/2015 "
			puts "Name: funny_pictures    Type: Folder     Size: 0k   Date_Modified: 02/02/2012 "
			puts ""
		elsif @@folder == "Myclients"
			puts ""
			puts "Name: client_personal_details.xlsx     Type: Excel     Size: 1024k   Date_Modified: 03/08/2015"
			puts ""
		elsif @@folder == "funny_pictures"
			puts ""
			puts "-Empty-"
			puts ""
		else 
			puts "something went wrong"
		end
	end	

	def self.cdMyclients
		@@folder = "Myclients"
	end

	def self.cdFunnyPictures
		@@folder = "funny_pictures"
	end

	def self.help
		puts ""
		puts "(1) To list all files and folders in your current directory, Type: ls"
		puts "(2) To change folder, Type: cd <folder name>, eg. cd folder1. And to go back to the previous folder type: cd.."
		puts "(3) To disconnect from the host, Type: disconnect"
		puts ""
	end

	PASSWORD = 'superhardpassword'

	
end