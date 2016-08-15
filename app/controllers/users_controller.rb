class UsersController < ApplicationController
  post '/' do
    case params[:auth_type]
    when "logout"
      session.clear
      redirect '/' 
    when "login"
      @user = User.find_by( username: params[:user][:username] )
      if !@user.authenticate( params[:user][:password] )
        @session = session
        redirect '/'
      end
    when "signup"
      @user = User.create( params[:user] )
    end
    session[:id] = @user.id
    @session = session
    erb :'users/profile'
  end
end