class EntitiesController < ApplicationController
  load_and_authorize_resource

  def index
    redirect_to categories_url
  end

  def new
    @entity = Entity.new
  end

  def create
    @entity = Entity.new(entity_params)
    @entity.user = current_user

    respond_to do |f|
      if entity.save
        f.html { redirect_to @entity.categories.first }
      end
    end
  end

  private

  def entity_params
    params.require(:entity).permit(:name :amount, category_ids: [])
  end
end

