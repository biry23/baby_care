class Public::MembersController < ApplicationController
  before_action :authenticate_member!
  def index
    @members = Member.all
  end

  def my_page
    @member = current_member
  end

  def favorite
    @member = Member.find(params[:id])
    # ログイン中のユーザーのお気に入りのpost_idカラムを取得
    favorites = Favorite.where(member_id: current_member.id).pluck(:post_id)
    # postsテーブルから、お気に入り登録済みのレコードを取得
    @favorite_list = Post.find(favorites)
  end

  def show
    @member = Member.find(params[:id])
  end

  def edit
    # binding.pry
    # @member = current_member
    @member = Member.find(params[:id])
  end

  def update
    # @member = current_member
    @member = Member.find(params[:id])
    if @member.update(member_params)
      redirect_to members_my_page_path
    end
  end

  private
  def member_params
    params.require(:member).permit(:email, :member_name, :age, :introduction)
  end
end
