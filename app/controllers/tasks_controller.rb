class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(params[:task])
    if @task.save
      redirect_to root_url, :notice => "Task created!"
    else
      render :action => "new"
    end
  end
  
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to root_url, :notice => "Task deleted!" 
  end
end
