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
        erb :'users/login'
    end

    post "/login" do
        # binding.pry
        @user = User.find_by(email: params[:email])

        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect to "/ask_the_eightball"
        else
            @errors = "[\"Incorrect email and/or password\"]"
            erb :'users/login'
        end
    end

    get "/ask_the_eightball" do
        # binding.pry
        authenticate
        @user = current_account

        @answer_lists = @user.answer_lists
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