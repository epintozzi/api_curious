require 'rails_helper'

RSpec.describe GistsController, type: :controller do

  describe "GET #index" do
    it "returns http success", :vcr do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      get :index
      
      expect(response).to have_http_status(:success)
    end
  end

end
