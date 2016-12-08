FactoryGirl.define do
  factory :user do
    username "epintozzi"
    email "erin@email.com"
    uid 1
    name "Erin Pintozzi"
    location "Denver"
    token ENV["github_user_token"]
  end
end
