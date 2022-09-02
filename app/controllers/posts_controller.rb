class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy send_mail]

  def index
    @posts = Post.all
  end

  def show; end

  def new
    @post = Post.new
  end

  def edit; end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'

    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: 'Post was successfully deleted.'
  end

  private

  def set_post
    if Post.exists?(params[:id])
      @post = Post.find(params[:id])
    else
      redirect_to posts_path, notice: 'Record not found.'
    end
  end

  def post_params
    params.require(:post).permit(:title, :description, :user_id)
  end
end
