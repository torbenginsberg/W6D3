class UsersController < ApplicationController
    def index
        if params.has_key?(:username)
            @users = User.where("username LIKE ?", "#{params[:username]}%")
                if @users.empty?
                    render json: user.errors.full_messages, status: :unprocessable_entity
                end
            render json:@users
        else
            @users = User.all
            render json:@users
        end
    end

    def create
        user = User.new(user_params)
        if user.save
            render json: user
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        @user = User.find(params[:id])
        render json: @user
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to user_url(@user)
        else
            render json: @user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        # redirect_to users_url
        render json: @user
    end

    private
    def user_params
        params.require(:user).permit(:username)
    end
end