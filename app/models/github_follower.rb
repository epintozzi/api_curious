class GithubFollower
  attr_reader :login, :avatar

  def initialize(attributes = {})
    @login = attributes[:login]
    @avatar = attributes[:avatar_url]
  end

  def self.for_user(user)
    GithubService.new.followers(user).map do |follower_list|
      GithubFollower.new(follower_list)
    end
  end

end
