require 'rails_helper'

RSpec.feature 'Signup', type: :feature do
  given(:user) { FactoryBot.build(:user) }

  scenario 'Signing up as a new user' do
    visit new_user_registration_path
    within 'form' do
      fill_in 'Full name', with: user.name
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      fill_in 'Password confirmation', with: user.password
    end
    click_button 'Next'
    expect(page).to have_content 'CATEGORIES'
  end

  given(:other_user) { FactoryBot.create(:user) }

  scenario 'Signing up with existing email' do
    visit new_user_registration_path
    within 'form' do
      fill_in 'Full name', with: user.name
      fill_in 'Email', with: other_user.email
      fill_in 'Password', with: user.password
      fill_in 'Password confirmation', with: user.password
    end
    click_button 'Next'
    expect(page).to have_content 'REGISTER'
  end
end
