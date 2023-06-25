class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_commentable
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        format.js { }
        format.html { redirect_to @comment.commentable, notice: 'Comment was successfully created.' }
      else
        @comment.errors.full_messages
        format.html { redirect_to @comment.commentable, alert: 'Error creating comment.' }
        format.js { render :create_failed }
      end
    end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.js { }
        format.html { redirect_to @comment.commentable, notice: 'Comment was successfully updated.' }
      else
        format.html { render :edit, alert: 'Error updating comment.' }
        format.js { render :update_failed }
      end
    end
  end

  def post
    commentable.is_a?(Post) ? commentable : commentable.post
  end

  private
    def set_commentable
      resource, id = request.path.split('/')[1, 2]
      @commentable = resource.singularize.classify.constantize.find(id)
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:content)
    end

    def correct_user
      @comment = current_user.comments.find_by(id: params[:id])
      redirect_to comments_path, notice: "Not authorized to edit this comment" if @comment.nil?
    end
end