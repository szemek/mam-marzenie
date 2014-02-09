class TasksController < ApplicationController
  def create
    @task = Task.create(new_task_params)
    redirect_to dream_path
  end

  private

    def new_task_params
      params[:task].store(:user_id, current_user.id)
      params[:task].store(:dream_id, @dream_id)
      params.require(:task).permit(:sponsor_id, :result, :description)
    end
end
