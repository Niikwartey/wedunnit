class TodosController < ApplicationController
  # create
  put '/' do
    if Helper.current_user(session)
      todo = Todo.create( params[:todo] )
      todo.is_done = false
      Helper.current_user(session).todos << todo
    end
    redirect '/'
  end

  # delete
  delete '/' do
    todo = Todo.find( params[:todo_id] )
    todo.delete
    redirect '/'
  end


   # edit
  patch '/' do
    @user = User.find( session[:id] )
    todo = Todo.find( params[:todo_id] )
    case params[:patch_type]
    when "check-off"
      todo.is_done = !todo.is_done
    when "make-editable"
      @todo_to_edit_id = todo.id
    when "edit-task"
      todo.update( params[:todo] )
      @todo_to_edit_id = nil
    end
    todo.save
    #redirect '/'
    @session = session
    erb :'users/profile'
  end
end