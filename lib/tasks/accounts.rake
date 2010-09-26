namespace :accounts do
	def ask message
		print message
		STDIN.gets.chomp
	end
	
	desc "Add a new account"
	task :add, :username, :password, :needs => [:environment] do |t, args|
		puts "Adding a new account"
		u = User.new
		u.login = args.username
		u.password = args.password
		if u.save
			puts "Account created"
		elsif
			puts "Account creation failed"
		end
	end
end
