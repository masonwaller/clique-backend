class UsersController < ApplicationController
    def index
        @users = User.all
        render json: {users: @users}
    end
    def show
        @user = User.find(params[:id])
        render json: {user: @user}
    end
    def new 
        @user = User.new
    end
    def create 
        print("=================================")
        @user = User.new(user_params)
        #store in lowercare to avoid duplcates
        @user.email.downcase!
        if @user.valid?
            @user.save
            render json: {user: @user}
        end
    end

    def login
        @user = User.find_by(email: user_login_params[:email])
        #User#authenticate comes from BCrypt using JWT
        if @user && @user.authenticate(user_login_params[:password])
          puts @user
          # encode token comes from ApplicationController
          render json: { user: @user }.to_json, status: :accepted
        else
          render json: { message: 'Invalid username or password' }, status: :unauthorized
        end
      end

    private 
    def user_params
        params.require(:user).permit( :email, :password, :name, :age, :bio, :job, :school)
    end
    def user_login_params
        # params { user: {username: 'Chandler Bing', password: 'hi' } }
        params.require(:user).permit(:email, :password)
      end
end
