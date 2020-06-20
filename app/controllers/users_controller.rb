get "/login" do
    erb :'users/login'
end

post "/login" do
    @user = params[:email]
    redirect to "/ask_the_eightball"
end