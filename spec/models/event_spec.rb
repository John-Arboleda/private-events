require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'Associations' do
    it { should have_many(:attendees) }
    it { should have_many(:subscriptions) }
    it { should belong_to(:creator).class_name('User') }
  end
end

RSpec.describe Event, type: :model do
  subject do
    User.create(id: 5, username: 'John', email: 'john@gmail.com', password: '123456')

    Event.new(
      name: 'First event',
      description: 'This is my first event',
      date: '2021-12-24',
      location: 'Earth',
      user_id: 5
    )
  end

  it 'valid event with all required fields' do
    expect(subject).to be_valid
  end

  it 'invalid event without name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'invalid event without description' do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it 'invalid event without location' do
    subject.location = nil
    expect(subject).to_not be_valid
  end

  it 'invalid event without a user_id logged in' do
    subject.user_id = 999
    expect(subject).to_not be_valid
  end
end
