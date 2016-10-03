class UsersController < ApplicationController
  before_action :set_user, only:[:show]

  def show
    @pins = @user.pins
  end

  def index
    @users = User.all_except(current_user)
  end

  private
    def set_user
      @user = User.find(params[:id])
    end
end
