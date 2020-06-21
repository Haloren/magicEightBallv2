class AnswerListsController < ApplicationController

    get "/answerlists" do
        authenticate
        @user = current_account
        # binding.pry

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

        erb :'answer_lists/update_list'
    end

    patch "/answerlists/:id" do
        authenticate
        @user = current_account
        # binding.pry

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