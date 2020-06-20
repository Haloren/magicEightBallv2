class UsersController < ApplicationController

    get "/create_account" do
        erb :'users/create_account'
    end

    post "/create_account" do
        @user = User.create(parmas)
        redirect to "/ask_the_eightball"
    end
    
    get "/login" do
        # binding.pry
        erb :'users/login'
    end

    post "/login" do
        @user = params[:email]
        redirect to "/ask_the_eightball"
    end

    get "/ask_the_eightball" do
        erb :'users/ask_question'
    end

    post "/answer" do
        erb :'users/eightball_answer'
    end
    
    get "/logout" do
        session.destroy
        redirect to "/"
    end

end