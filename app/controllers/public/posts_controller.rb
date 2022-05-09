class Public::PostsController < ApplicationController
  before_action :authenticate_member!, only: [:new, :edit]
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.member_id = current_member.id
    if @post.save!
      redirect_to posts_path
    else
      render :new
    end
  end

  def index
    @posts = Post.all
  end

  def my_posts
    @posts = current_member.posts
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_my_posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :text, :genre_id)
  end
end
