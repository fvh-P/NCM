class NameCardsController < ApplicationController
  require 'chunky_png/rmagick'

  before_action :correct_user?, only: [:edit, :destroy]
  helper_method :authenticated?

  def index
    if params[:id].present?
      redirect_to name_card_path(params[:id], password: params[:password])
    else
      redirect_to root_path
    end
  end

  def edit
    @name_card = NameCard.find(params[:id])
    @name_card.image.cache! unless @name_card.image.blank?
    @name_card.image_back.cache! unless @name_card.image_back.blank?
  end

  def show
    @name_card = NameCard.find(params[:id])
    @is_received = received?(params[:id])
    width = 240
    height = 240
    tmp = RQRCode::QRCode.new(url_for(controller: :name_cards, action: :show, id: @name_card.id, password: @name_card.password), level: :h)
    image = ChunkyPNG::RMagick.export(tmp.as_png.resize(width, height))
    @qr = ChunkyPNG::RMagick.import(image).to_data_url
  end

  def new
    @name_card = NameCard.new
  end

  def create
    @name_card = NameCard.new(name_card_params)
    if @name_card.save
      redirect_to @name_card
      flash[:success] = '名刺を作成しました。'
    else
      render :new
    end
  end

  def update
    @name_card = NameCard.find(params[:id])
    if @name_card.update_attributes(name_card_params)
      redirect_to @name_card
      flash[:success] = '名刺を更新しました。'
    else
      render :edit
    end
  end

  def destroy
    NameCard.find(params[:id]).destroy
    flash[:success] = '削除しました。'
    redirect_to current_user
  end

  private

  def name_card_params
    params.require(:name_card).permit(
      :card_name, :name, :free_text, :password, :password_confirmation,
      :twitter_account_name, :mastodon_account_name, :mastodon_instance_name, :free_account,
      :image, :image_cache, :remove_image, :image_back, :image_back_cache, :remove_image_back,
      idols_attributes: [:name, :id, :_destroy]
    ).merge(
        user_id: current_user.id
    )
  end

  def authenticated?
    @name_card.password.empty? || params[:password] && @name_card.password == params[:password]
  end

  def correct_user?
    name_card = NameCard.find(params[:id])
    if user_signed_in? && (name_card.user_id == current_user.id)
      true
    else
      redirect_back fallback_location: root_path
      flash[:danger] = 'ログインされていないか、権限がありません。'
      false
    end
  end

  def received?(id)
    user_signed_in? && ReceivedCard.exists?(user_id: current_user.id, name_card_id: id)
  end
end
