class OrgsController < ApplicationController

  def index
    user = User.find(current_user.id)
    @orgs = GithubService.new.orgs(user)
  end

end
