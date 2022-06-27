require "rails_helper"

RSpec.describe Api::V1::UsersController do
    describe "GET index" do
      it "returns @users" do
        get :index
        expect(response).to have_http_status(200)
      end
    end
end