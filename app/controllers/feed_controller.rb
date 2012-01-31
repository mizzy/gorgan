class FeedController < ApplicationController
  def index
    if not session[:access_token]
      redirect_to '/auth/github'
      return
    end

    client = Octokit::Client.new(
        login: 'me',
        oauth_token: session[:access_token],
    )

    render text: client.orgs()[0]["login"]
  end
end
