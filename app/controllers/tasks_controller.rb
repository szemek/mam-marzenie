class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def edit
  end

  def update
    @task.update(task_params)
    redirect_to dream_path(@task.dream_id)
  end

  def create
    hash = task_params
    hash[:user] = current_user
    hash[:dream] = Dream.find(hash[:dream_id])
    @task = Task.create(hash.except(:dream_id))
    redirect_to dream_path(@task.dream_id)
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    hash = params.require(:task).permit(
      :sponsor, :dream_id, :result, :description, :user_id
    )
    hash[:sponsor] = Sponsor.where(fullname: hash[:sponsor]).first_or_create
    hash.except(:dream_id, :user_id)
  end
end
