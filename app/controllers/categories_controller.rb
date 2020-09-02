class CategoriesController < ApplicationController
    def index
        @cat = Category.all 
        render json: {categories: @cat}
    end
    def show
        @cat = Category.find(params[:id])
        render json: {category: @cat}, include: ['users']
    end
end
