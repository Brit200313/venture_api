require 'rails_helper'

RSpec.describe List, :type => :model do
  let(:user) { User.create!(name: "API User", email: "britt@bloc.io", password: "password") }
  let(:list) { List.create!(name: "Totally Tubular List", user_id: user.id) }
  it { is_expected.to have_many(:items) }
  it { is_expected.to validate_presence_of(:name) }

  describe "attributes" do
    it "should respond to name" do
      expect(list).to respond_to(:name)
    end
    it "should respond to email" do
      expect(list).to respond_to(:user_id)
    end
  end
end
