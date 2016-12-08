class ReposController < ApplicationController

  def index
    user = User.find(current_user.id)
    @user_repos = GithubRepo.for_user(user)
  end

end
