class UsersController < ApplicationController

  def show
    user = User.find(current_user.id)
    @user_commits = GithubCommit.for_user(user.username)
  end

end
