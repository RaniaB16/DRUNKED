class FriendshipsController < ApplicationController
  def new
    @users = User.all.where.not(id: current_user.id)
    @friendship = Friendship.new
    authorize(@friendship)
  end

  def add_friends
    params[:users].each do |user|
      Friendship.create(user_one_id: current_user.id, user_two_id: User.find(user.to_i).id)
    end
    @friendship = Friendship.last
    authorize(@friendship)
    redirect_to dashboard_path
  end
end
