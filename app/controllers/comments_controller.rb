class CommentsController < ApplicationController
  def index
  end
  
  def new
    @topic = Topic.find(params[:topic_id])
    @comment = Comment.new(topic_id: params[:topic_id])
  end
  
  def create
    @topic = Topic.find(params[:topic_id])
    @comment = current_user.comments.new(comment: comment_params[:comment], topic_id: params[:topic_id])
    binding.pry
    if @comment.save
      redirect_to topics_path, success: '投稿に成功しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end
  
  private
  def comment_params
    params.require(:comment).permit(:comment, :topic_id)
  end
end
