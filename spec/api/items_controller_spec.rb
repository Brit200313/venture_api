require 'rails_helper'

RSpec.describe Api::ItemsController, type: :controller do
  include AuthHelper

  let(:the_user) { FactoryGirl.create(:user) }
  let(:the_list) { FactoryGirl.create(:list, user_id: the_user.id) }
  let(:the_item_to_update) { FactoryGirl.create(:item, list_id: the_list.id) }

  it "POST create" do
    http_login
    post :create, params: {item: {name: "Fancy Item"}, list_id: the_list.id}
    expect(response).to have_http_status(200)
  end

  it "PUT update" do
    http_login
    put :update, params: {item: {completed: true}, list_id: the_list.id, id: the_item_to_update.id}
    expect(response).to have_http_status(200)
  end
end
