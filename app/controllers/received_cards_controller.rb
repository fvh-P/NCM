class ReceivedCardsController < ApplicationController
  before_action :user_signed_in?

  def index
    @received_cards = ReceivedCard.where(user_id: user_id).reverse_order
  end

  def create
    @received_card = ReceivedCard.new(user_id: user_id, name_card_id: name_card(params[:id]).id)

    if name_card(params[:id]).password == params[:password] && @received_card.save
      redirect_back(fallback_location: root_path)
      flash[:success] = 'この名刺を受け取りました。'
    else
      redirect_back(fallback_location: root_path)
      flash[:danger] = '名刺を受け取れませんでした。すでに受け取り済みか、またはパスワードなどが正しいか確認してください。'
    end

  end

  def destroy
    @received_card = ReceivedCard.find_by(user_id: user_id, name_card_id: name_card(params[:id]).id)

    if @received_card.destroy
      redirect_back(fallback_location: root_path)
      flash[:warning] = 'この名刺を受け取りリストから削除しました。'
    else
      redirect_back(fallback_location: root_path)
      flash[:danger] = '削除に失敗しました。詳しくは管理者にお問い合わせください。'
    end
  end

  private

  def user_id
    current_user.id
  end

  def name_card(id)
    NameCard.find(id)
  end
end
