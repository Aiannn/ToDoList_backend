class TasksController < ApplicationController

    def index 
        @tasks = Task.all 
        render json: @tasks, :except => [:created_at, :updated_at]
    end

    def create 
        @user = User.find_by(username: params[:username])
        @task = Task.create(text: params[:text], category: params[:category], user_id: @user.id) 
        render json: @task 
    end

    def update
        @task = Task.find_by(id: params[:id]) 
        @task.update(text: params[:text])
        render json: @task 
    end
    
    def destroy 
        Task.destroy(params[:id])
    end
end
