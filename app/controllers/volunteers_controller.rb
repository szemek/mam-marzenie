# Volunteers are users
class VolunteersController < ApplicationController
  def index
    @users = User.all
  end
end
