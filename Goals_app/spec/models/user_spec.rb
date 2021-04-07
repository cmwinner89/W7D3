# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string           not null
#  session_token   :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require 'rails_helper'

RSpec.describe User, type: :model do
  # subject(:user) do 
  #   User.create!(username: "yoyo", password: 'password')
  # end
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:session_token) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6)}

  it { should have_many(:goals)}

  describe 'uniqueness' do

    before(:each) do
      # build(:user)
      create(:user)
    end
        it { should validate_uniqueness_of(:session_token) }
        it { should validate_uniqueness_of(:username) }
  end

  describe '#is_password?' do

    let(:user) {create(:user)}

    context 'with correct password' do
      it 'should return true' do
        expect(user.is_password?('password')).to be true
      end
    end

    context 'with incorrect password' do
      it 'should return false' do
        expect(user.is_password?('password1111')).to be false
      end
    end
  end
end
