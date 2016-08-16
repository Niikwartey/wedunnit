class UsersController < ApplicationController
  post '/signup' do
    login User.create( params[:user])
    redirect '/'
  end
end