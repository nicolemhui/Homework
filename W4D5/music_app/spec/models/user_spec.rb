require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) do
    FactoryBot.build(:user,
      email: "me@fakesite.com",
      password: "good_password")
  end

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }

  describe '#is_password?' do
    pw = "password123"

    it 'returns true if password is the same after BCrypt' do
      expect(user.is_password?(pw)).to eq ("good_password")
    end
  end

  describe '#reset_session_token' do
    it 'ensure that session token is not same after user logs out' do
      prev_token = user.session_token
      user.reset_session_token
      expect(prev_token).to_not eq (user.session_token)
    end
  end

  describe '::find_by_credentials' do
    before { user.save! }

    it 'finds a user by username and password' do
      expect(User.find_by_credentials('me@fakesite.com', 'good_password')).to eq(user)
    end
  end
end
