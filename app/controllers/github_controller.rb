class GithubController < ApplicationController
	post '/event_handler' do
	  @payload = JSON.parse(params[:payload])

	  case request.env['HTTP_X_GITHUB_EVENT']
	  when "pull_request" # Handle Pull Requests
	    if @payload["action"] == "opened"
	      Github.instance.process_pull_request(@payload["pull_request"])
	    end
	  end
	end
end