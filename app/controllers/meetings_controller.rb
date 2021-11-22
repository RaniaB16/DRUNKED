class MeetingsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @meeting = Meeting.new
    authorize(@meeting)
  end

  def create
    @meeting = Meeting.new(party_params)
    authorize @meeting
    @user = current_user
    @meeting.party_id = @party.id
    if @meeting.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  private

  def party_params
    params.require(:meeting).permit(:user_id, :party_id, :start_date, :end_date, :approved)
  end
end
