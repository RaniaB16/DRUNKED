class FriendshipsController < ApplicationController
  def new
    @users = User.all.where.not(id: current_user.id)
    @friendship = Friendship.new
    authorize(@friendship)
  end

  def add_friends
    @current_friends = current_user.friends.pluck(:id)
    if params[:users]
      @current_friends.reject! { |friends| params[:users].include?(friends) }
      @current_friends.each { |friend| Friendship.find_by(user_one_id: current_user.id, user_two_id: friend.to_i).destroy }
      params[:users].each do |user|
        if Friendship.find_by(user_one_id: current_user.id, user_two_id: User.find(user.to_i).id).nil?
          Friendship.create!(user_one_id: current_user.id, user_two_id: User.find(user.to_i).id)
        end
      end
    else
      Friendship.where(user_one_id: current_user.id).destroy_all
    end
    Friendship.last.nil? ? @friendship = Friendship.new : @friendship = Friendship.last
    authorize(@friendship)
    redirect_to dashboard_path
  end

  def destroy
    @friendship = Friendship.find(params[:id])
    authorize(@friendship)
    @friendship.destroy
    redirect_to dashboard_path
  end
end
