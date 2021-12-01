require 'rails_helper'

RSpec.describe '/entities', type: :request do
  login_user

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_entity_url
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new entity' do
        expect do
          post entities_url,
              params: { entity: FactoryBot.attributes_for(:entity,                    category_ids: [FactoryBot.create(:category).id]) }
        end.to change(Entity, :count).by(1)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new entity' do
        expect do
          post entities_url, params: { entity: FactoryBot.attributes_for(:entity, name: nil) }
        end.to change(Entity, :count).by(0)
      end
    end
  end
end

  describe "GET /new" do
    it "returns http success" do
      get "/entities/new"
      expect(response).to have_http_status(:success)
    end
  end
end

