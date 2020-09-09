class QuotesController < ApplicationController

    def index 
        @quotes = Quote.all 
        render json: @quotes, :except => [:created_at, :updated_at]
    end 

    def create 
        @user = User.find_by(username: params[:username])
        @quote = Quote.create(name: params[:name], user_id: @user.id)
        render json: @quote
    end

    #I didn't come up something cool with third table(which is requirement) so I decided to build Quotes
end
