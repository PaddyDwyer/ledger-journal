namespace :accounts do
	def ask message
		print message
		STDIN.gets.chomp
	end
	desc "Add a new account"
	task :add => :environment do
		puts "Adding a new account"
		u = User.new
		u.login = ask("Please enter your username: ")
		u.password = ask("Please enter your password: ")
		if u.save
			puts "Account created"
		elsif
			puts "Account creation failed"
		end
	end
end
