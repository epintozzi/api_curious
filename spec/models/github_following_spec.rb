require 'rails_helper'

describe GithubFollowing do
  context ".for_user(user)" do
    it "returns list of people a user follows", :vcr do
        user = User.new(token: ENV["github_user_token"])
        following = GithubFollowing.for_user(user)
        follows = following.first

        expect(following).to be_an(Array)
        expect(follows).to be_a(GithubFollowing)
        expect(follows).to respond_to(:login)
        expect(follows).to respond_to(:avatar)
    end
  end

end
