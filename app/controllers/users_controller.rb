class UsersController < ApplicationController

  def show
    @user_commits = GithubService.new.all_commits_by_user("#{current_user.username}")
  end

end
