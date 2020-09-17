class CategoriesController < ApplicationController
    def index
        @cat = Category.all 
        render json: {categories: @cat}
    end
    def show
        @cat = Category.find(params[:id])
        render json: {category: @cat}, include: ['users']
    end
    def create
        @cat = Category.new(category_params)
        @cat.save
    end

    private
    def category_params
        params.require(:category).permit( :name, :desc)
    end
end
