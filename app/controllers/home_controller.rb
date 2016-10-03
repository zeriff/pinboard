class HomeController < ApplicationController

  def index
    @pins = current_user.pins
    @user = current_user
  end
end
