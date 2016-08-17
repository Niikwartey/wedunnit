class TodosController < ApplicationController
  # create
  post '/todos' do
    if user_signed_in?
      todo = current_user.todos.create( 
        params[:todo].merge(
          is_done: false,
        ) 
      )
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
    # check for patch type
    case params[:patch_type]
    when "make-editable"
      edit_todo(todo)
    when "edit-task"
      todo.update( params[:todo] )
      session[:editable_todo_id] = nil
    end
    todo.save
    redirect '/'
  end

  helpers do 
    def edit_todo(todo)
      if session[:editable_todo_id] == todo.id
        session[:editable_todo_id] = nil
      else
        session[:editable_todo_id] = todo.id
      end 
    end
  end 
end