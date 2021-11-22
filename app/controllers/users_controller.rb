class UsersController < ApplicationController

  def create
    @user = User.new
    authorize @user
    @user = current_user
    @user.user_id = @user.id
  end
end
