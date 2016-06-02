class Github
	include Singleton

	attr_reader :client

	ACCESS_TOKEN = ENV['GITHUB_ACCESS_TOKEN']

	def initialize
		@client = Octokit::Client.new(:access_token => ACCESS_TOKEN)
	end

	def process_pull_request(pull_request)
	  	puts "Processing pull request..."
	  	# Update the status to pending
	  	@client.create_status(pull_request['base']['repo']['full_name'], pull_request['head']['sha'], 'pending')
	  	
	  	# Here we would run the tests or pass it off to another service like Travis...
	  	sleep 5 

	  	# When the response comes back, if it's good then we set the status as success,
	  	# stating that the pull request can be merged.

	  	# Update the status to success
		@client.create_status(pull_request['base']['repo']['full_name'], pull_request['head']['sha'], 'success')
	    
	    # We could also updat the status to failure or error.

		puts "Pull request processed!"
	  end
end