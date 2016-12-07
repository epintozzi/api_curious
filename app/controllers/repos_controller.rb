class ReposController < ApplicationController

  def index
    @user_repos = GithubService.new.user_repos("#{current_user.username}")
  end

end
