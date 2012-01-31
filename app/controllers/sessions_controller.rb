class SessionsController < ApplicationController
  def create
    session[:access_token] = request.env['omniauth.auth']['credentials'].token
    client = Octokit::Client.new(
        login: 'me',
        oauth_token: session[:access_token],
    )
    session[:user] = client.user()
    redirect_to feed_url
  end
end

