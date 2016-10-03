class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pin, only: [:create]
  respond_to :js

  def create
    @comment = @pin.comments.build(comment_params)
    @comment.user = current_user;
    @comment.save
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment.destroy;
  end

  private
  def comment_params
    params.permit(:comment)
  end

  def set_pin
    @pin = Pin.find(params[:id])
  end
end
