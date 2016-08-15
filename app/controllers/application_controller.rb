require './config/environment'


class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  enable :sessions
  set :session_secret, "secret"


  get '/' do
    if session[:id]
      @session = session
      @user = User.find( session[:id] )
      erb :'users/profile'
    else
      @session = session
      erb :'users/auth'
    end
  end

  # not_found do
  #   @session = session
  #   @user = 
  #   status 404
  #   erb :oops
  # end
end