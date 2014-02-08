# Volunteers are users
class VolunteersController < ApplicationController
  def index
    @search = User.search(params[:q])
    @users = @search.result
  end

  def show
    @user = User.find(params[:id])
  end
end
