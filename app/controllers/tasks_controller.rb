class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def user_params
    params.require(:task).permit(:title, :start, :finish)
  end

  def create
    @task = Task.new(user_params)
    if @task.save
      flash[:notice] = "スケジュールを新規作成しました"
      redirect_to :tasks
    else
      render "new"
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(user_params)
      flash[:notice] = "#{@task.id}を編集しました"
      redirect_to :tasks
    else
      render "edit"
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:notice] = "スケジュールを削除しました"
    redirect_to :tasks
  end
end
