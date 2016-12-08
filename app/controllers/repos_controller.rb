class ReposController < ApplicationController

  def index
    user = User.find(current_user.id)
    @user_repos = GithubService.new.user_repos(user)
  end

end
