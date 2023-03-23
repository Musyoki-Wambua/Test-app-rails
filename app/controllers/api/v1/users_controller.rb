class Api::V1::UsersController < ApplicationController

    skip_before_action :authorized, only: [:create]


    def create
        @user = User.create(user_params)
        if @user.valid?
          render json: { data: @user }, status: :created
        else
          render json: { error: @user.errors.full_messages }, status: :unprocessable_entity
        end
      end
    
      private
      
      def user_params
        params.require(:user).permit(:username, :password, :bio, :avatar)
      end
end
