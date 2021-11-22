class PartiesController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @party = Party.new
    authorize(@party)
  end

  def create
    @party = Party.new(party_params)
    authorize @party
    @user = current_user
    @party.user_id = @user.id
    if @party.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  private

  def party_params
  params.require(:party).permit(:name, user_id)
  end
end
