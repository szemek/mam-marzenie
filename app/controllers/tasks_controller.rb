class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def create
    hash = task_params
    hash[:sponsor] = Sponsor.where(fullname: hash[:sponsor]).first_or_create
    hash[:user] = current_user
    hash[:dream] = Dream.find(hash[:dream_id])
    @task = Task.create(hash.except(:dream_id))
    redirect_to dream_path(@task.dream_id)
  end

  private

  def task_params
    params.require(:task).permit(
      :sponsor, :dream_id, :result, :description
    )
  end
end
