require 'rails_helper'

describe "a user can see their commit activity" do
  scenario "user sees commit activity", :vcr do
      user = create(:user, username: "epintozzi")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_path(user)

      expect(page).to have_content "Message"
  end
end
