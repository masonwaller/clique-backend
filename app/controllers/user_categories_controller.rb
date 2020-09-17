class UserCategoriesController < ApplicationController
    def index
        @categories = UserCategory.all
        render json: {usercat: @categories}
    end
    def new
        @usercat = UserCategory.new
    end
    def create
        @usercat = UserCategory.new(usercat_params)
        @usercat.save
        render json: {usercat: @usercat}
    end

    private
    def usercat_params
        params.require(:usercat).permit(:user_id, :category_id)
    end
end
