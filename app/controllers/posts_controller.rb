class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find params[:id]
  end

  def edit
    @post = Post.find params[:id]
  end

  def update
    @post = Post.find params[:id]
    if @post.update(allowed_params)
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def allowed_params
    params.require(:post).permit(:title, :text, :thumbnail_url)
  end
end
