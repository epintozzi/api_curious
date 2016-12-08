require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #show" do
    it "returns http success", :vcr do
      user = create(:user, username: "epintozzi")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      get :show, id: user.id

      expect(response).to have_http_status(:success)
    end
  end

end
