require 'rails_helper'

describe "a user can visit gist index page" do
  scenario "user can visit gist index page", :vcr do
      user = create(:user, username: "epintozzi")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit gists_path

      expect(page).to have_content "Gists live here"
  end
end
