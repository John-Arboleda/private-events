require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create(username: 'John', email: 'john@gmail.com', password: '123456') }
  describe 'Associations' do
    it { should have_many(:attended_events) }
    it { should have_many(:subscriptions) }
    it { should have_many(:events) }
  end
end
