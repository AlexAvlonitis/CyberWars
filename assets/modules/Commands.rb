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
		puts "-Body: Hello,\nI've heard you are one of the best in the field that's why i want to offer you a job."
		puts "I will need you to break into this server: server21.contoso.com,"
		puts "find their client details and send them to me.\nI trust your skills and your payment will be 5000$."
		puts ""
	end
end

module TargetCommands

	def self.ls
		puts ""
		puts "Name:Myclients    Type:Folder     Size:5k   Date_Modified:#{Time.now} "
		puts ""
	end	

	def self.cd 
		puts ""
		puts "clients"
		puts ""
	end

	PASSWORD = 'superhardpassword'

	
end