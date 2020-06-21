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
        # binding.pry
        authenticate
        @user = current_account

        @question = params[:question] 
        default = params[:list_id]
        # binding.pry

        if default == "default"
            default_answers
        else
            #binding.pry 
            answer_list = AnswerList.find_by(id: params[:list_id])
            
            if answer_list
                @answers = answer_list.answers.select { |answer| answer.content != ""}
                @answer = @answers.sample
            else
                redirect '/ask_the_eightball'
            end
        end
        erb :'users/eightball_answer'
    end
    
    get "/logout" do
        session.destroy
        redirect to "/"
    end

    get "/how_to_use" do
        @user = current_account

        erb :'how_to_use'
    end
    
end