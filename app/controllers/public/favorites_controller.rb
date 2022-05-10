class Public::FavoritesController < ApplicationController
  before_action :authenticate_member!
  def create
    @favorite = current_member.favorites.build(favorite_params)
    @post = @favorite.post
    @favorite.save
    # if @favorite.valid?
    #   @favorite.save
    #   respond_to :js
    # end
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @post = @favorite.post
    @favorite.destroy
    # if @favorite.destroy
    #   respond_to :js
    # end
  end

  private
  def favorite_params
    params.permit(:post_id)
  end
end
