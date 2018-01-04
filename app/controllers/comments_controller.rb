class CommentsController < ApplicationController
  respond_to :json

  before_action :find_post, only: [:index]

  def index
    respond_with @post.comments
  end

  def create
    comment = Comment.create!(comment_params)
    render json: {id: comment.id, email: comment.email, text: comment.text}
  end

  def destroy
    respond_with Comment.destroy(params[:id])
  end

  private
  def comment_params
    params.require(:comment).permit(:email, :text, :post_id)
  end

  def find_post
    @post = Post.find_by! id: params[:post_id]
  end
end
