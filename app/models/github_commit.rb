class GithubCommit
  attr_reader :repo, :payload, :repo_name, :message_hash

  def initialize(attributes = {})
    @repo = attributes[:repo]
    @payload = attributes[:payload]
    @repo_name = attributes[:repo][:name]
    @message_hash = attributes[:payload][:commits]
  end

  def self.for_user(username)
    GithubService.new.all_commits_by_user(username).map do |item|
      GithubCommit.new(item)
    end
  end

  def self.get_commit_message(commits)
    messages = []
    commits.each do |commit|
      commit.message_hash.each do |message|
        messages << message[:message]
      end
    end
    messages
  end

end
