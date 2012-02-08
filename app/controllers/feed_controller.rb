class FeedController < ApplicationController
  include ApplicationHelper

  def index
    if not session[:access_token]
      redirect_to '/auth/github'
      return
    end
  end

  def org
    @org   = octokit.org(params[:org])
    @repos = octokit.org_repos(params[:org])
    @repos.each do |repo|
      repo["commits"] = octokit.commits("#{params[:org]}/#{repo['name']}")
    end
  end

end
