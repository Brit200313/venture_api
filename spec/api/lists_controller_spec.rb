require 'rails_helper'

RSpec.describe Api::ListsController, type: :controller do
  include AuthHelper

  let(:the_user) { FactoryGirl.create(:user) }

  it "POST create" do
    http_login
    post :create, list: {name: "Fancy List"}, user_id: the_user.id
    expect(response).to have_http_status(200)
  end
end
