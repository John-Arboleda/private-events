require 'rails_helper'

RSpec.describe 'Create Event', type: :feature do
  let(:user) { User.create(username: 'Foo Bar', email: 'foo@bar.com', password: '12345678') }
  scenario 'Create event with valid inputs' do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'
    sleep(3)
    visit new_event_path
    fill_in 'Name', with: 'Event'
    #fill_in 'Date', with: Date.today
    fill_in 'Description', with: 'Very Cool Event!'
    fill_in 'Location', with: 'USA'


    click_on 'Create Event'
    expect(page).to have_content('Event successfully created!')
  end

  scenario 'Create event with blank inputs' do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'
    sleep(3)
    visit new_event_path
    fill_in 'Name', with: ''
    #fill_in 'Date', with: Date.today
    fill_in 'Description', with: ''
    fill_in 'Location', with: 'USA'
    click_on 'Create Event'
    expect(page).to_not have_content('Event successfully created!')
  end
end