require 'rails_helper'

RSpec.feature 'NewEntity', type: :feature do
  login_user

  background do
    @category = FactoryBot.create(:category, user: @user)
  end

  given(:entity) { FactoryBot.build(:entity) }

  scenario 'Creating a transaction with valid data' do
    visit new_entity_path
    within 'form' do
      fill_in 'Name', with: entity.name
      fill_in 'Amount', with: entity.amount
      select @category.name
    end
    click_button 'Save'
    expect(page).to have_current_path category_path(@category)
  end

  scenario 'Creating a transaction with invalid data' do
    visit new_entity_path
    within 'form' do
      fill_in 'Name', with: entity.name
      fill_in 'Amount', with: entity.amount
    end
    click_button 'Save'
    expect(page).to have_content 'ADD A NEW TRANSACTION'
  end
end
