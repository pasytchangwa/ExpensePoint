require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validates' do
    subject { FactoryBot.build :user }

    it 'should have a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should not have a blank name' do
      subject.name = ' '
      expect(subject).to_not be_valid
    end

    it 'should not have name longer than 150 characters' do
      subject.name = 'A' * 151
      expect(subject).to_not be_valid
    end

    it 'should have an email' do
      subject.email = nil
      expect(subject).to_not be_valid
    end
  end

  describe 'association' do
    context 'has-many categories' do
      subject { FactoryBot.build(:user_with_categories, categories_count: 3) }

      it 'should have categories' do
        expect(subject.categories.length).to be 3
      end
    end

    context 'has-many entities' do
      subject { FactoryBot.build(:user_with_entities, entities_count: 5) }

      it 'should have entities' do
        expect(subject.entities.length).to be 5
      end
    end
  end
end
