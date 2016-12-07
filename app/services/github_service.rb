class GithubService

  def repos_by_user(username)
    response = Faraday.get("https://api.github.com/users/#{username}/repos?client_id=#{ENV['github_client_id']}&client_secret=#{ENV['github_client_secret']}")

    repo_data = JSON.parse(response.body, symbolize_names: true)

    repo_data.first
  end

  def all_commits_by_user(username)
    response = Faraday.get("https://api.github.com/users/#{username}/events?client_id=#{ENV['github_client_id']}&client_secret=#{ENV['github_client_secret']}&per_page=100")

    event_data = JSON.parse(response.body, symbolize_names: true)

    push_events = []
    event_data.each do |commit|
      push_events << commit if commit.has_value?("PushEvent")
      end

    push_events
  end

  def commits_by_user_repo(username)
    response = Faraday.get("https://api.github.com/repos/#{username}/api_curious/commits?client_id=#{ENV['github_client_id']}&client_secret=#{ENV['github_client_secret']}")

    commit_data = JSON.parse(response.body, symbolize_names: true)

    commit_data.first
  end

  def commit_details_by_repo_url(url)
    response = Faraday.get("#{url}?client_id=#{ENV['github_client_id']}&client_secret=#{ENV['github_client_secret']}")

    commit_details = JSON.parse(response.body, symbolize_names: true)

    commit_details
  end

end
