class CommentsController < ApplicationController

  def create
    @item = Item.find(params[:item_id])
    Comment.create(comment_params)
    redirect_to item_path(@item.id)
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
