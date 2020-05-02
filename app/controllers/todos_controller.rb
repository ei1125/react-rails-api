class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :update, :destroy]

  def index
    @todos = Todo.all
    render json: @todos
  end

  def show
    render json: @todo
  end

  def new
    @todo = Todo.new
  end

  def edit
  end

  def create
    @todo = Todo.new(create_params)
    if @todo.save
      render json: @todo
    else
      render :new
    end
  end

  def update
    if @todo.update!(update_params)
      render json: @todo
    else
      render :edit
    end
  end

  def destroy
    @todo.destroy
    render json: @todos
  end

  private
    def set_todo
      @todo = Todo.find(params[:id])
    end

    def create_params
      params.require(:todo).permit(%i[title body])
    end

    def update_params
      params.require(:todo).permit(%i[id title body])
    end

    def destroy_params
      params.require(:todo).permit(:id)
    end
end
