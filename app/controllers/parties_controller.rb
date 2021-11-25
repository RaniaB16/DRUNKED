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
  end

  def create
    @party = Party.new(party_params)
    @user = current_user
    @party.user = @user
    authorize(@party)
    if @party.save
      Meeting.create(user: current_user, party: @party)
      # party_params[:user_ids].each_with_index do |user_id, i|
      #   next if i.zero?

      #   Meeting.create(user_id: user_id.to_i, party: @party)
      # end
      redirect_to party_path(@party)
    else
      render :new
    end
  end

  # def destroy
  #   @party = find_party
  #   authorize(@party)
  #   @party.destroy
  # end

  # def update
  #   @party = find_party
  #   authorize(@party)
  #   @party.update(party_params)
  # end

  private

  def find_party
    @party = Party.find(params[:id])
  end

  def party_params
    params.require(:party).permit(:name, user_ids: [])
  end
end
