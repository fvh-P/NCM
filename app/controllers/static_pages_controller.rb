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
    send_file 'public/apple_touch_icon.png', :type => 'image/png', :disposition => 'inline'
  end
end
