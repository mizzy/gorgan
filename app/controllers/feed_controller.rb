class FeedController < ApplicationController
  def index
    if not session[:access_token]
      redirect_to '/auth/github'
      return
    end

    @orgs = client.orgs
  end

  def org
    @org   = client.org(params[:org])
    @repos = client.org_repos(params[:org])
  end

  private
  def client
    Octokit::Client.new(
        login: 'me',
        oauth_token: session[:access_token],
    )
  end

end
