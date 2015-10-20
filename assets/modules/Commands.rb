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
		puts "(1)To find the open ports of a remote host,\nType: portscan <hostname Or Ip of the target>, eg. portscan 32.134.12.3"
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
		puts "Bruteforcing {@pcname} 21, this might take a while..."
		puts "#{rand(10)}"
	end

	def self.emails
		puts ""
		puts "-=Welcome to CryptoMailer service. You have a new message=-"
		puts ""
		puts "-From: Secret Client-31"
		puts "-Subject: Need Cash?"
		puts "-Body: Hello,\nI've heard you are one of the best in the field and i would need your help."
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

	PASSWORD = 'noaccess'

	
end