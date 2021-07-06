require 'rails_helper'

RSpec.describe User, type: :feature do
  it 'Sign up with valid inputs' do
    visit 'users/sign_up'
    fill_in 'user[username]', with: 'LeBron-James'
    fill_in 'user[email]', with: 'lbj@gmail.com'
    fill_in 'user[password]', with: '123456'
    fill_in 'user[password_confirmation]', with: '123456'
    click_on 'Sign up'
    sleep(1)
    visit root_path
    expect(page).to have_content('LeBron-James')
  end

  it 'Sign up with invalid inputs' do
    visit 'users/sign_up'
    fill_in 'user[username]', with: ''
    fill_in 'user[email]', with: 'LeBron-James'
    fill_in 'user[password]', with: '123456'
    fill_in 'user[password_confirmation]', with: '123456'
    click_on 'Sign up'
    sleep(1)
    visit root_path
    expect(page).to_not have_content('Welcome! You have signed up successfully.')
  end

  let(:user) { User.create(username: 'LeBron-James', email: 'lbj@gmail.com', password: '123456') }
  scenario 'Log in with valid inputs' do
    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'
    sleep(1)
    expect(page).to have_content('Signed in successfully.')
  end

  scenario 'Log in with invalid inputs' do
    visit new_user_session_path
    fill_in 'Email', with: 'LeBron-James'
    fill_in 'Password', with: user.password
    click_on 'Log in'
    sleep(1)
    expect(page).to_not have_content('Signed in successfully.')
  end
end
