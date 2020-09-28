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
        @user = User.find_by(id: @usercat.user_id)
        render json: {user: @user}, include: ['user_categories']
    end
    def destroy
        @usercat = UserCategory.find_by(id: params[:id])
        @usercat.destroy
    end

    private
    def usercat_params
        params.require(:usercat).permit(:user_id, :category_id)
    end
end
