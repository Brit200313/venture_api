require 'rails_helper'

RSpec.describe Api::UsersController, type: :controller do
  include AuthHelper

  it "GET index returns http success" do
    http_login
    get :index
    expect(response).to have_http_status(:success)
  end

  it "POST create" do
    http_login
    post :create, user: {name: "Shanaynay", password_digest: "smartpassword123", email: "hello@gmail.com"}
    expect(response).to have_http_status(200)
  end
end
