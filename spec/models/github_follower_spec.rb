require 'rails_helper'

describe GithubFollower do
  context ".for_user(user)" do
    it "returns list of followers for a user", :vcr do
        user = User.new(token: ENV["github_user_token"])
        followers = GithubFollower.for_user(user)
        follower = followers.first

        expect(followers).to be_an(Array)
        expect(follower).to be_a(GithubFollower)
        expect(follower).to respond_to(:login)
        expect(follower).to respond_to(:avatar)
    end
  end

end
