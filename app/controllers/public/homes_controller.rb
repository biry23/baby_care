class Public::HomesController < ApplicationController
  def top
    @posts = Post.order('id DESC').limit(10)
  end

  def about
  end
end
