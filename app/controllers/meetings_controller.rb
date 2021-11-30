class MeetingsController < ApplicationController
  skip_before_action :authenticate_user!

  def update
    @meeting = Meeting.find(params[:id])
    authorize(@meeting)
    @meeting.update(meeting_params)
    redirect_to dashboard_path
  end

  private

  def meeting_params
    params.require(:meetings).permit(:end_date)
  end
end
