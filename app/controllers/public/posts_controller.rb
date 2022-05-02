class Public::PostsController < ApplicationController
  before_action :authenticate_member!, only: [:new, :edit]
  def new
  end

  def index
  end

  def edit
  end

  def show
  end
end
