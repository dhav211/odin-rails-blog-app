class PostsController < ApplicationController
  before_action :set_post, except: %i[index new create]

  def index
    @posts = Post.order(created_at: :desc)
  end

  def show
    # before_action
  end

  def edit
    # before_action
  end

  def new
    @post = Post.new
  end

  def update
    if @post.update(allowed_params)
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def create
    @post = Post.new allowed_params

    if @post.save
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_post
    @post = Post.find params[:id]
  end

  def allowed_params
    params.require(:post).permit(:title, :text, :thumbnail_url)
  end
end
