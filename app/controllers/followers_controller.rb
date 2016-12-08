class FollowersController < ApplicationController

  def index
    user = User.find(current_user.id)
    @followers = GithubService.new.followers(user)
  end

end
