# Volunteers are users
class VolunteersController < ApplicationController
  def index
    @users = User.all
  end

  def search
    @users = User.where('fullname LIKE ?', "%#{params[:fullname]}%")
    render :index
  end
end
