class BeveragesController < ApplicationController

  def create
    @meeting = Meeting.find(params[:beverage][:meeting_id])
    if (params[:beverage][:drink_id]).empty?
      redirect_to request.referer
      # raise
    else
      @drink = Drink.find(params[:beverage][:drink_id])
      @beverage = Beverage.new(beverage_params)
      @beverage.drink = @drink
      if @beverage.save!
        redirect_to request.referer
        #else
        #render :new
      end
    end
    authorize(Beverage)
  end

  def destroy
    @beverage = Beverage.find(params[:id])
    authorize(@beverage)
    @beverage.destroy
    redirect_to request.referer
  end

  private

  def beverage_params
    params.require(:beverage).permit(:meeting_id, :drink_id)
  end
end
