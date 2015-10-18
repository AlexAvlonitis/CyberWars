module Commands
	def self.help
		puts "(1) To see all the available commands, type: commands"
		puts "(2) To view your emails, type: emails"
		puts "(3) To exit, type: exit"
	end	

	def self.commands
		puts "To find the open ports of a remote host, \nType: portscan <hostname Or Ip of the target>, eg. portscan 32.134.12.3"
	end
end