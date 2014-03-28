# MembersController
class MembersController < ApplicationController
  def create
    Member.find_or_create_by(create_member_params)
    redirect_to :back
  end

  def destroy
    member = Member.find(params[:id])
    member.destroy if member.user == current_user

    redirect_to :back
  end

  private

    def create_member_params
      params[:member].store(:user_id, current_user.id)
      params.require(:member).permit(:dream_id, :user_id)
    end
end
