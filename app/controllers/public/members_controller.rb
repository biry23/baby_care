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
    @member = current_member
  end

  def update
    @member = current_member
    if @member.update(member_params)
      redirect_to member_path(@member.id)
    end
  end

  private
  def member_params
    params.require(:member).permit(:email, :member_name, :age, :introduction)
  end
end
