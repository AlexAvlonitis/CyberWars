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
		puts "(1) To find open ports of a remote host,\nType: portscan <hostname Or Ip of the target>, eg. portscan 32.134.12.3"
		puts ""
		puts "(2) To connect to a remote server,\nType: connect <hostname or IP> <port number>, eg. connect 32.2.13.4 1234"
		puts ""
		puts "(3) To Brute Force a service,\nType: bruteforce <hostname or IP> <port number>, eg. bruteforce 32.2.13.4 1234"
		puts ""
		puts "(4) To send a file back to your computer once you are connected on a remote host,\nfirst you need to be in the folder that holds the file and then,\nType: cryptosend <filename> <Your computer name> , eg. cryptosend info.doc hackOS"
		puts ""
		puts "(5) To erase the logs from a remote host and cover your tracks once you finished your job,\nType: ./eraseLogs.script, and then disconnect immediately"
		puts ""
	end

	def self.portscan
		puts ""
		puts "Scanning..."
		sleep(2)
		puts "open ports:"
		puts "- 21 ftp"
		puts "- 80 http 'filtered' "
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
		puts ""
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
		puts "and steal their client details.\nI trust your skills and your payment will be 5000$."
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

	def self.eraseLogs
		puts ""
		puts "Erasing Logs..."
		sleep(2)
		puts ""
		puts "Logs have been erased, Disconnect immediately!"
		puts ""
		if @@track >= 1 #it becomes 1 only if he sends the file back to his computer
			return @@completed = 1 #it return 1 and when he disconnects then he wins
		end
	end

	def self.cat
		if @@folder == "Myclients"
			puts ""
			puts "Clients Personal Details"
			puts "NAME\t\tEMAIL\t\t\tCREDIT_CARD_INFO"
			puts "Bart\t\tbart@simson.com\t\t12381212312313123"
			puts "Homer\t\thomer@simson.com\t123814535313123"
			puts "Marge\t\tmarge@simson.com\t1224123123132344"
			puts "Maggie\t\tmaggie@simson.com\t1234244312313123"
			puts "Lisa\t\tlisa@simson.com\t\t123812123132346756"
			puts "..."
			puts ""
		else
			puts "wrong input"
		end
	end

	@@track = 0 #To track the objective progress
	@@completed = 0 #if 1 then you completed the mission

	def self.getCompleted
		@@completed
	end

	def self.cryptosend
		if @@folder == "Myclients"
			puts ""
			puts "Connecting to hackOS..."
			sleep(1)
			puts "Encrypting connection..."
			sleep(2)
			puts "Sending file..."
			sleep(2)
			puts "File Send"
			puts "closing connection..."
			sleep(1)
			puts ""
			@@track += 1
		else
			puts "wrong input"
		end
	end

	def self.help
		puts ""
		puts "(1) To list all files and folders in your current directory, Type: ls"
		puts "(2) To change folder, Type: cd <folder name>, eg. cd folder1. And to go back to the previous folder type: cd.."
		puts "(3) To preview a file, Type: cat <file name>, eg. cat phonebook.txt"
		puts "(3) To disconnect from the host, Type: disconnect"
		puts ""
	end

	PASSWORD = 'superhardpassword'

	
end