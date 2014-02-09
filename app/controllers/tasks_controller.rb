class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def edit
  end

  def update
    @task.update(task_params)
    redirect_to dream_path(@task.dream_id)
  end

  def create
    @task = Task.create(task_params)
    redirect_to dream_path(@task.dream)
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params[:task].store(:user_id, current_user.id)
    params.require(:task).permit(
      :sponsor_id, :dream_id, :result, :description, :user_id
    )
  end
end
