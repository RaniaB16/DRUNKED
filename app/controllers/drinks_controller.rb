class DrinksController < ApplicationController

  def new
    @drink = Drink.new
    authorize(@drink)
  end

  def create
    @drink = Drink.new(party_params)
    authorize @drink
    @user = current_user
    @drink.user_id = @user.id
    if @drink.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  private

  def party_params
    params.require(:drink).permit(:brand, :quantity, :alcool_type, :alcool_degree)
  end
end
