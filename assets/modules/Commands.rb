module Commands
	def self.help
		puts "(1) To see all the available commands, type: commands"
		puts "(2) To view your emails, type: emails"
		puts "(3) To exit, type: exit"
	end	

	def self.commands
		puts "(1)To find the open ports of a remote host,\nType: portscan <hostname Or Ip of the target>, eg. portscan 32.134.12.3"
		puts "(2)To Brute Force a service, Type: bruteforce <hostname or IP> <port number>, eg. bruteforce 32.2.13.4 80"
	end

	def self.portscan
		puts "Scanning..."
		sleep(2)
		puts "open ports:"
		puts "-21 ftp"
		puts "-80 http filtered"
	end

	def self.emails
		puts "Welcome to CryptoMailer service. You have 1 new message"
		puts "-From: Secret Client-31"
		puts "-Subject: Need Cash?"
		puts "-Body: Hello,\nI've heard you are one of the best in the field and i would need your help."
		puts "The instructions are the following.\nI will need you to break into this server: server21.contoso.com,"
		puts "find their client details and send them to me.\nI trust your skills and your payment will be 5000$."
	end
end