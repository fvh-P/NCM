class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user?

  def show
    @users_name_cards = NameCard.where(user_id: params[:id])
  end

  private

  def correct_user?
    begin
      user = User.find(params[:id])
    rescue
    end
    unless current_user == user
      redirect_to current_user
    end
  end
end
