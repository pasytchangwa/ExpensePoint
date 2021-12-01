require 'rails_helper'

RSpec.feature 'Entities', type: :feature do
  login_user

  background do
    @category = FactoryBot.create(:category, user: @user)
    FactoryBot.build_list(:entity, 3, user: @user, category_ids: [@category.id])
  end

  scenario 'View list of entities' do
    visit category_path(@category)
    @category.entities.each do |entity|
      expect(page).to have_content entity.name
    end
  end

  scenario 'View total amount of category' do
    visit category_path(@category)
    expect(page).to have_content @category.amount
  end

  scenario 'Clicking ADD A NEW ENTITY opens form' do
    visit category_path(@category)
    click_link 'ADD A NEW ENTITY'
    expect(page).to have_current_path(new_entity_path)
  end
end