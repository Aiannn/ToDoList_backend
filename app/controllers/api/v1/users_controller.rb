class Api::V1::UsersController < ApplicationController
    # skip_before_action :authorized, only: [:create, :index] 

    def profile
        user_hash = {user: current_user}
        render json: user_hash, include: [:tasks, :quotes], status: :accepted
    end

    def index #no need for this, it's just for my testing purposes.
        @users = User.all 
        render json: @users, include: [:tasks, :quotes]
    end

    def update
        @user = User.find_by(username: params[:username])
        @user.update(avatar: params[:avatar], bio: params[:bio])
        render json: @user 
    end

    def create 
        @user = User.create(username: params[:user][:username], password: params[:user][:password])
        if @user.valid?
            @token = encode_token({user_id: @user.id})
            render json: {user: @user, jwt: @token}, status: :created
        else 
            render json: {error: 'failed to create user'}, status: :not_acceptable
        end 
    end 

end
