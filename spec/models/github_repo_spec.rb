require 'rails_helper'

describe GithubRepo do
  context ".for_user(user)" do
    it "returns repos for a user", :vcr do
        user = User.new(token: ENV["github_user_token"])
        user_repos = GithubRepo.for_user(user)
        repo = user_repos.first

        expect(user_repos).to be_an(Array)
        expect(repo).to be_a(GithubRepo)
        expect(repo).to respond_to(:name)
        expect(repo).to respond_to(:language)
        expect(repo).to respond_to(:description)
        expect(repo).to respond_to(:updated_at)
    end
  end
end
