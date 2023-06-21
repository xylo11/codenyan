class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_to @comment.post, notice: 'Comment was successfully created.'
    else
      redirect_to @comment.post, alert: 'Error creating comment.'
    end
  end

  def destroy
    @comment.destroy
    redirect_to @comment.post, notice: 'Comment was successfully deleted.'
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:content, :post_id, :parent_comment_id)
    end

    def correct_user
      @comment = current_user.comments.find_by(id: params[:id])
      redirect_to comments_path, notice: "Not authorized to edit this comment" if @comment.nil?
    end
end