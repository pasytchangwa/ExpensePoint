require 'rails_helper'

RSpec.feature 'Login', type: :feature do
  background do
    @user = FactoryBot.create(:user, password: 'mypassword')
  end

  scenario 'Logging in with correct credentials' do
    visit new_user_session_path
    within 'form' do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: 'mypassword'
    end
    click_button 'Log In'
    expect(page).to have_content 'CATEGORIES'
  end

  scenario 'Loggin in with incorrect credentials' do
    visit new_user_session_path
    within 'form' do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: 'mpassword'
    end
    click_button 'Log In'
    expect(page).to have_content 'LOGIN'
  end
end