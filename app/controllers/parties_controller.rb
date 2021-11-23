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
    authorize(@party)
  end

  def create
    @party = Party.new(party_params)
    @user = current_user
    @party.user_id = @user.id
    authorize(@party)
  end

  def destroy
    @party = find_party
    authorize(@party)
    @party.destroy
  end

  def update
    @party = find_party
    authorize(@party)
    @party.update(params[:party])
  end

  private

  def find_party
    @party = Party.find(params[:id])
  end

  def party_params
    params.require(:party).permit(:name, :start_date)
  end
end
