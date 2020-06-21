class UsersController < ApplicationController

    get "/create_account" do
        erb :'users/create_account'
    end

    post "/create_account" do
        # binding.pry
        @user = User.create(params)
        if @user.valid?
            session[:user_id] = @user.id
            redirect to "/ask_the_eightball"
        else
            @errors = @user.errors.full_messages
            erb :'users/create_account'
        end
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