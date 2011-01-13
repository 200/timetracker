class ReportsController < ApplicationController

  def new
    load_task
    @report = @task.reports.new
  end

  def create
    load_task
    @report = @task.reports.new(params[:report])
    if @report.save
      redirect_to task_url(@task), :notice => "Report created!"
    else
      render :action => "new"
    end
  end

  private

  def load_task
    @task = Task.find(params[:task_id])
  end
end
