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
    @rate = alcool_rate(@meeting, current_user)
    @difference = difference(@meeting)
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

  def alcool_rate(meeting, user)
    meeting.drinks.map { |drink| (drink.drink_sum / user.user_sum) }.sum.round(2)
  end

  def difference(meeting)
    t = Time.now
    drink_time = meeting.drinks.last.created_at
    hour = 3600
    difference = (((t - drink_time) + hour) / 3600).round(2)
    return difference
  end
end
