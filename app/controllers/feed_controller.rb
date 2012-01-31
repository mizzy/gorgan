class FeedController < ApplicationController
  def index
    if not session[:access_token]
      redirect_to auth_url
      return
    end
  end
end
