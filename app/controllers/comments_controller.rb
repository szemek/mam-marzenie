class CommentsController < ApplicationController
  def create
    dream = Dream.find(params[:dream_id])
    dream.comments.create(comment_params)

    redirect_to dream
  end

  def destroy
    dream = Dream.find(params[:dream_id])
    Comment.find(params[:id]).destroy

    redirect_to dream
  end

  private

    def comment_params
      params[:comment].store(:user_id, current_user.id)
      params.require(:comment).permit(:body, :user_id)
    end
end
