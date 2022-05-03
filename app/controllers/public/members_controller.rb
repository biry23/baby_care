class Public::MembersController < ApplicationController
  before_action :authenticate_member!
  def index
    @members = Member.all
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
