class TasksController < ApplicationController

    def index 
        @tasks = Task.all 
        render json: @tasks, :except => [:created_at, :updated_at]
    end

    def create 
        @task = Task.create(text: params[:text], category: params[:category]) 
        render json: @task 
    end 
end
