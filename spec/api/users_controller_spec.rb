require 'rails_helper'

RSpec.describe Api::UsersController, type: :controller do
  include AuthHelper
  let(:user_to_delete) { FactoryGirl.create(:user) }

  it "GET index returns http success" do
    http_login
    get :index
    expect(response).to have_http_status(:success)
  end

  it "POST create" do
    http_login
    post :create, params: {user: {name: "Shanaynay", password_digest: "smartpassword123", email: "hello@gmail.com"}}
    expect(response).to have_http_status(200)
  end

  it "DELETE delete" do
    http_login
    delete :destroy, params: {id: user_to_delete.id}
    expect(response).to have_http_status(204)
  end
end
