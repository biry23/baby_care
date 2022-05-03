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

  def edit
    @post = Post.find(params[:id])
  end

  def show
    @post =Post.find(params[:id])
  end

  private
  def post_params
    params.require(:post).permit(:title, :text)
  end
end
