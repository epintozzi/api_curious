class GithubService

  def initialize
    @conn = Faraday.new(url: "https://api.github.com/") do |faraday|
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
  end

  def all_commits_by_user(username)
    response = conn.get("/users/#{username}/events?client_id=#{ENV['github_client_id']}&client_secret=#{ENV['github_client_secret']}&per_page=100")

    event_data = JSON.parse(response.body, symbolize_names: true)
    get_push_events(event_data)
  end

  def get_push_events(event_data)
    push_events = []
    event_data.each do |commit|
      push_events << commit if commit.has_value?("PushEvent")
      end

    push_events
  end

  def commit_details_by_repo_url(url)
    response = Faraday.get("#{url}?client_id=#{ENV['github_client_id']}&client_secret=#{ENV['github_client_secret']}")

    commit_details = JSON.parse(response.body, symbolize_names: true)

    commit_details
  end

  def user_repos(user)
    response = conn.get("/user/repos?access_token=#{user.token}&per_page=100")
    JSON.parse(response.body, symbolize_names: true)
  end

  def starred(user)
    response = conn.get("/user/starred?access_token=#{user.token}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def followers(user)
    response = conn.get("/user/followers?access_token=#{user.token}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def following(user)
    response = conn.get("/user/following?access_token=#{user.token}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def orgs(user)
    response = conn.get("/user/orgs?access_token=#{user.token}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def gists(user)
    response = conn.get("/gists?access_token=#{user.token}")
    JSON.parse(response.body, symbolize_names: true)
  end


  private
    attr_reader :conn

end
