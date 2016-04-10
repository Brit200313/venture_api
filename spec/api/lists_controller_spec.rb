require 'rails_helper'

RSpec.describe Api::ListsController, type: :controller do
  include AuthHelper

  let(:the_user) { FactoryGirl.create(:user) }
  let(:list_to_update) { FactoryGirl.create(:list, user_id: the_user.id) }
  let(:list_to_delete) { FactoryGirl.create(:list, user_id: the_user.id) }

  it "GET index returns http success" do
    http_login
    get :index
    expect(response).to have_http_status(:success)
  end

  it "POST create" do
    http_login
    post :create, params: {list: {name: "Fancy List"}, user_id: the_user.id}
    expect(response).to have_http_status(200)
  end

  it "PUT update" do
    http_login
    put :update, params: {list: {permission: "private"}, user_id: the_user.id, id: list_to_update.id}
    expect(response).to have_http_status(200)
  end

  it "DELETE delete" do
    http_login
    delete :destroy, params: {id: list_to_delete.id, user_id: the_user.id}
    expect(response).to have_http_status(204)
  end
end
