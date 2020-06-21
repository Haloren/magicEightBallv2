class AnswerListsController < ApplicationController

    get "/answerlists" do

    end

    post "/answerlists" do

    end

    get "/answerlists/new" do

    end

    get "/answerlists/:id" do

    end

    get "/answerlists/:id/update" do

    end

    patch "/answerlists/:id" do

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