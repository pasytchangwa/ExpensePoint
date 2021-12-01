class CategoriesController < ApplicationController
  load_and_authorize_resource
  before_action :set_category, only: %i[show]

  def index
    @categories = current_user.categories.all
  end

  def show
    @entitiess = @category.entities.order(created_at: 'desc')
  end

  def new
    @category = Category.new
  end

  def create
    @category = current_user.categories.new(category_params)

    respond_to do |f|
      if @category.save
        f.html { redirect_to root_path, notice: 'A category has been created successfully' }
      else
        f.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @categoy.destroy
    respond_to do |f|
      f.html { redirect_to root_path, notice: 'A category has been deleted successfully!' }
    end
  end

  private

  def set_category
    @category = Category.includes(:entities).find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end

