module Comments
  class CommentsController < ApplicationController
    before_action :set_commentable

    def create
      @comment = @commentable.comments.new(comment_params)
      @comment.user = current_user

      if @comment.save
        redirect_to @comment.commentable, notice: 'Comment was successfully created.'
      else
        render :new
      end
    end

    private

    def set_commentable
      @commentable = Comment.find(params[:comment_id])
    end

    def comment_params
      params.require(:comment).permit(:content)
    end
  end
end
