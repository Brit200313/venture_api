require 'rails_helper'

RSpec.describe Item, :type => :model do
  let(:user) { User.create!(name: "API User", email: "britt@bloc.io", password: "password") }
  let(:list) { List.create!(name: "Totally Tubular List", user_id: user.id) }
  let(:item) { Item.create!(name: "Awesome Item", list_id: list.id) }
  it { is_expected.to validate_presence_of(:name) }

  describe "attributes" do
    it "should respond to name" do
      expect(item).to respond_to(:name)
    end
    it "should respond to email" do
      expect(item).to respond_to(:list_id)
    end
  end
end
