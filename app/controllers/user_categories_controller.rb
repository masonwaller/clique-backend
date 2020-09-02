class UserCategoriesController < ApplicationController
    def index
        @users = UserCategory.all
    end
    def new
        @user = UserCategory.new
    end
    def create
        @user = User.new(usercat_params)
        @user.save
    end

    private
    def usercat_params
        params.require(:usercat).permit(:user_id, :category_id)
    end
end
