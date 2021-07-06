require 'rails_helper'

RSpec.describe Subscription, type: :model do
  describe 'Associations' do
    it { should belong_to(:event) }
    it { should belong_to(:user) }
  end
end
