class GithubFollowing
  attr_reader :login, :avatar

  def initialize(attributes = {})
    @login = attributes[:login]
    @avatar = attributes[:avatar_url]
  end

  def self.for_user(user)
    GithubService.new.following(user).map do |follower_list|
      GithubFollowing.new(follower_list)
    end
  end

end
