class BeveragesController < ApplicationController

  def create
    @drink = Drink.find(params[:beverage][:drink_id])
    @meeting = Meeting.find(params[:beverage][:meeting_id])
    @beverage = Beverage.new(beverage_params)
    @beverage.drink = @drink
    authorize(@beverage)
    if @beverage.save!
      redirect_to request.referer
    else
      render :new
    end
  end

  private

  def beverage_params
    params.require(:beverage).permit(:meeting_id, :drink_id)
  end
end
