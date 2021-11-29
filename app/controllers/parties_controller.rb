class PartiesController < ApplicationController
  def index
    @parties = policy_scope(Party).where(user: current_user)
  end

  def new
    @party = Party.new
    authorize(@party)
  end

  def show
    @party = find_party
    @beverage = Beverage.new
    @meeting = @party.meetings.find_by(user_id: current_user.id)
    authorize(@party)
    @rate = @meeting.alcool_rate
    @alcool = @meeting.sobriaty[:alcool_rate]
    @sober = @meeting.sobriaty[:time_elapsed]
  end

  def create
    @party = Party.new(party_params)
    @user = current_user
    @party.user = @user
    authorize(@party)
    if @party.save
      Meeting.create(user: current_user, party: @party)
      redirect_to party_path(@party)
    else
      render :new
    end
  end

  private

  def find_party
    @party = Party.find(params[:id])
  end

  def party_params
    params.require(:party).permit(:name, user_ids: [])
  end

  # def time_peak(meeting)
  #   first_drink_created = meeting.drinks.first.created_at
  #   time_in_sec = first_drink_created.strftime("%s")
  #   peak_time = time_in_sec.to_i + (meeting.drinks.count * 2700)
  #   (Time.at(peak_time)).strftime("%H:%m")
  # end

  # def sober_at(time_peak, alcool_rate)
  #   raise
  #   time.now - time-peak ==> 20min
  #   new_alcool_rate = alcool_rate - 0.12*(time.now - time-peak)/60
  # end
  # def difference(meeting, alcool_rate)
  #   t = Time.now
  #   drink_time =
  #     if alcool_rate.zero?
  #       0
  #     else
  #       meeting.drinks.last.created_at
  #     end
  #   hour = 3600
  #   difference = (((t - drink_time) + hour) / 3600).round(2)
  #   return difference
  # end
end
