class BeveragesController < ApplicationController

  def create
    @meeting = Meeting.find(params[:beverage][:meeting_id])
    if (params[:beverage][:drink_id]).empty?
      redirect_to request.referer
    else
      @drink = Drink.find(params[:beverage][:drink_id])
      @beverage = Beverage.new(beverage_params)
      @beverage.drink = @drink
      respond_to do |format|
        if @beverage.save
          format.html { redirect_to request.referer }
          format.text { render partial: 'beverages/list.html', locals: { beverages: @meeting.beverages } }
        else
          format.html { render 'parties/show' }
          format.json
        end
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
