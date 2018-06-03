require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create_user', type: :model do
    it do
      user = create(:user)
      
      expect(user).to be_valid
      is_expected.to validate_presence_of(:email)
      expect(user.first_name).to eq('First Name')
      expect(user.last_name).to eq('Last Name')
      expect(user.password).to eq('password')
      expect(user.password_confirmation).to eq(user.password)
    end
  end
  
  context 'validators' do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
  end
end
  