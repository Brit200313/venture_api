require 'rails_helper'

RSpec.describe Api::ItemsController, type: :controller do
  include AuthHelper

  let(:the_user) { FactoryGirl.create(:user) }
  let(:the_list) { FactoryGirl.create(:list, user_id: the_user.id) }

  it "POST create" do
    http_login
    post :create, item: {name: "Fancy Item"}, list_id: the_list.id
    expect(response).to have_http_status(200)
  end
end
