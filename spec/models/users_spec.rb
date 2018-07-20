require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validation' do
    context 'valid user' do
      let(:user) { build(:user, :shizuka) }

      it 'is valid' do
        expect(user.valid?).to eq(true)
      end
    end

    context 'invalid users' do
      let(:invalid_user) { build(:user, :empty_email) }

      it 'is invalid (empty email)' do
        expect(invalid_user.valid?).to eq(false)
      end
    end
  end
end
