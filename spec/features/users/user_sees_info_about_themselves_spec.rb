require 'rails_helper'

describe "a user can see info about themselves" do
  scenario "user sees info about themselves", :vcr do
      user = create(:user, username: "epintozzi")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_path(user)

      expect(page).to have_content "epintozzi"
      expect(page).to have_content "Denver"
      expect(page).to have_content "Organizations"
      expect(page).to have_content "erin@email.com"
  end
end
