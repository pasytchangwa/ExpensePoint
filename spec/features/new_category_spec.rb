require 'rails_helper'

RSpec.feature 'NewCategory', type: :feature do
  login_user

  given(:category) { FactoryBot.build(:category) }

  scenario 'Creating category with valid data' do
    visit new_category_path
    within 'form' do
      fill_in 'Name', with: category.name
      fill_in 'Icon', with: category.icon
    end
    click_button 'Save'
    expect(page).to have_current_path root_path
  end

  scenario 'Creating a category with invalid data' do
    visit new_category_path
    within 'form' do
      fill_in 'Name', with: category.name
    end
    click_button 'Save'
    expect(page).to have_content 'ADD A NEW CATEGORY'
  end
end
