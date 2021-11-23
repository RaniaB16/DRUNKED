class BeveragesController < ApplicationController

  def create
    @beverage = Beverage.new(beverage_params)
    authorize @beverage
    @beverage.drink_id = @drink.id
    if @beverage.save
      redirect_to show_path
    else
      render :new
    end
  end

  private

  def beverage_params
    params.require(:beverage).permit(:meeting_id, :drink_id)
  end
end
