require 'rails_helper'

RSpec.describe 'Create Event', type: :feature do
  let(:user) { User.create(username: 'LeBron-James', email: 'lbj@gmail.com', password: '123456') }
  scenario 'Create event with valid inputs' do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'
    sleep(1)
    visit new_event_path
    fill_in 'Name', with: 'First event'
    fill_in 'Description', with: 'I\'m hosting my very first event'
    fill_in 'Location', with: 'Earth'
    click_on 'Create Event'
    expect(page).to have_content('Event successfully created!')
  end

  scenario 'Create event with blank inputs' do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'
    sleep(1)
    visit new_event_path
    #fill_in 'Name', with: ''
    fill_in 'Description', with: ''
    fill_in 'Location', with: 'USA'
    click_on 'Create Event'
    expect(page).to_not have_content('Event successfully created!')
  end
end

RSpec.describe 'Subscribe to event', type: :feature do

  let(:creator) { User.create(id: 1, username: 'LeBron-James', email: 'lbj@gmail.com', password: '123456') }
  let(:user) { User.create(id: 2, username: 'John', email: 'john@gmail.com', password: '123456') }
  
  scenario 'Subscribe to an event' do
    visit new_user_session_path
    fill_in 'Email', with: creator.email
    fill_in 'Password', with: creator.password
    click_on 'Log in'
    sleep(1)
    visit new_event_path
    fill_in 'Name', with: 'First event'
    fill_in 'Description', with: 'I\'m hosting my very first event'
    fill_in 'Location', with: 'Earth'
    click_on 'Create Event'
    visit destroy_user_session_path
    sleep(1)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'
    sleep(1)
    visit 'events/1'
    click_on 'Subscribe'
    expect(page).to have_content('You have signed up for the First event. Thank you!')
  end

  scenario 'Unsubscribe of an event' do
    visit new_user_session_path
    fill_in 'Email', with: creator.email
    fill_in 'Password', with: creator.password
    click_on 'Log in'
    sleep(1)
    visit new_event_path
    fill_in 'Name', with: 'First event'
    fill_in 'Description', with: 'I\'m hosting my very first event'
    fill_in 'Location', with: 'Earth'
    click_on 'Create Event'
    visit destroy_user_session_path
    sleep(1)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'
    sleep(1)
    visit 'events/1'
    click_on 'Subscribe'
    sleep(1)
    click_on 'Unsubscribe'
    expect(page).to have_content('You have unsubscribed of the First event!')
  end
end