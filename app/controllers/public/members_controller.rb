class Public::MembersController < ApplicationController
  before_action :authenticate_member!
  def index
    @members = Member.all
  end

  def show
    @member = Member.find(params[:id])
  end

  def edit
    @member = Member.find(params[:id])
  end
end
