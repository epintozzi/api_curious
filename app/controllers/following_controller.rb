class FollowingController < ApplicationController

  def index
    user = User.find(current_user.id)
    @following = GithubService.new.following(user)
  end

end
