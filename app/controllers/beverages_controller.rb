class BeveragesController < ApplicationController
  def new
    @beverage = Beverage.new
    authorize(@beverage)
  end

  def create
    @beverage = Beverage.new(beverage_params)
    authorize @beverage
    @drink = current_drink
    @beverage.drink_id = @drink.id
    if @beverage.save
      redirect_to dashboard_path
    else
      render :new
    end
  end
  private

  def party_params
    params.require(:beverage).permit(:meeting_id, :drink_id)
  end
end
