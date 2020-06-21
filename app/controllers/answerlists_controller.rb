class AnswerListsController < ApplicationController

    get "/answerlists" do
        authenticate
        @user = current_account
        # binding.pry

        
    end

    post "/answerlists" do
        authenticate
        @user = current_account
        # binding.pry


    end

    get "/answerlists/new" do
        authenticate
        @user = current_account
        # binding.pry


    end

    get "/answerlists/:id" do
        authenticate
        @user = current_account
        # binding.pry


    end

    get "/answerlists/:id/update" do
        authenticate
        @user = current_account
        # binding.pry


    end

    patch "/answerlists/:id" do
        authenticate
        @user = current_account
        # binding.pry


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