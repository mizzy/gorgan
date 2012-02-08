module ApplicationHelper

  def octokit
    Octokit::Client.new(
        login: 'me',
        oauth_token: session[:access_token],
    )
  end

end
