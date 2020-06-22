class AnswerListsController < ApplicationController

    get "/answerlists" do
        authenticate
        @user = current_account

        # binding.pry
        @answer_lists = @user.answer_lists

        erb :'answer_lists/select_list'
    end

    post "/answerlists" do
        authenticate
        @user = current_account
        # binding.pry

        erb :'answer_lists/select_list'
    end

    get "/answerlists/new" do
        authenticate
        @user = current_account
        # binding.pry

        erb :'answer_lists/new_list'
    end

    get "/answerlists/:id" do
        authenticate
        @user = current_account
        # binding.pry

        erb :'answer_lists/select_list'
    end

    get "/answerlists/:id/update" do
        authenticate
        @user = current_account
        # binding.pry

        @list = AnswerList.find_by(id: params[:id])
        # binding.pry

        erb :'answer_lists/update_list'
    end

    patch "/answerlists/:id" do
        authenticate
        @user = current_account
        # binding.pry 

        @list = AnswerList.find_by(id: params[:id])
        # binding.pry

        counter = 0
        while counter < 20
            old_answer = @list.answers[counter].content
            new_answer = params[:answers][counter]
            
            # binding.pry
            if old_answer != new_answer
                @list.answers[counter].content = params[:answers][counter]
                @list.answers[counter].save
            end
            counter += 1

        end
        
        # binding.pry
        @list.save

        erb :'answer_lists/select_list'
    end

    delete "/answerlists/:id/delete" do
        authenticate
        @user = current_account
        # binding.pry
        
        @list = AnswerList.find_by(id: params[:id])
        @list.destroy

        redirect to '/answerlists'
    end

end