class MeetingsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @meeting = Meeting.new
    authorize(@meeting)
  end

  def create
    @meeting = Meeting.new(meeting_params)
    authorize @meeting
    #Attente de la show pour voir si methode fonctionne
    @user = current_user
    @meeting.party = Party.find(params[:party_id])
    @meeting.user = @user
    raise
    if @meeting.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  private

  def meeting_params
    params.require(:meeting).permit(:user_id, :party_id)
  end

end
