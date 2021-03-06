require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create!(name: "API User", email: "britt@bloc.io", password: "password") }
  it { is_expected.to have_many(:lists) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_length_of(:name).is_at_least(1) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_length_of(:email).is_at_least(3) }
  it { is_expected.to validate_uniqueness_of(:email) }
  it { is_expected.to allow_value("hello@bloc.io").for(:email) }
  it { is_expected.to validate_presence_of(:password) }
  it { is_expected.to have_secure_password }
  it { is_expected.to validate_length_of(:password).is_at_least(6) }

  describe "attributes" do
    it "should respond to name" do
      expect(user).to respond_to(:name)
    end
    it "should respond to email" do
      expect(user).to respond_to(:email)
    end
  end

  describe "invalid user" do
    let(:user_with_invalid_name) { User.new(name: "", email: "user@bloccit.com") }
    let(:user_with_invalid_email) {User.new(name: "Bloccit User", email: "") }
    let(:user_with_invalid_email_format) { User.new(name: "Bloccit User", email: "invalid_format") }

    it "should be an invalid user due to blank name" do
      expect(user_with_invalid_name).to_not be_valid
      end

    it "should be an invalid user due to blank email" do
      expect(user_with_invalid_email).to_not be_valid
      end

    it "should be an invalid user due to incorrectly formatted email" do
      expect(user_with_invalid_email_format).to_not be_valid
    end
  end
end
