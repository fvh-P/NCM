class StaticPagesController < ApplicationController

  def home
  end

  def help
  end

  def about
  end

  def contact
  end

  def apple_touch_icon
    render file: 'public/apple-touch-icon.png'
  end
end
