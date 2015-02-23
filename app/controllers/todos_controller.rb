class TodosController < ApplicationController

  before_action :set_todo, :only => [:edit, :update, :destroy, :show]

  before_action :ensure_current_user_is_todo_owner, :only => [:edit, :update, :destroy]

  def ensure_current_user_is_todo_owner
    if current_user != @todo.user
      redirect_to root_url, :notice => "Nice try, buddy"
    end
  end

  def set_todo
    @todo = Todo.find(params[:id])
  end

  def index
    @todos = current_user.todos
  end

  def show
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    @todo.user = current_user

    if @todo.save
      redirect_to todos_url, :notice => "Todo created successfully."
    else
      render 'new'
    end
  end

  def edit
  end

  def todo_params
    return params.require(:todo).permit(:content, :new_column)
  end

  def update
    @todo.update_attributes(todo_params)

    # @todo.content = params[:todo][:content]
    # @todo.user_id = params[:todo][:user_id]

    if @todo.save
      redirect_to todo_url(@todo.id), :notice => "Todo updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @todo.destroy

    redirect_to todos_url, :notice => "Todo deleted."
  end
end
