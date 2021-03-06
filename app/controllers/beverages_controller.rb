class BeveragesController < ApplicationController
  def create
    @meeting = Meeting.find(params[:beverage][:meeting_id])
    @party = @meeting.party
    if (params[:beverage][:drink_id]).empty?
      redirect_to request.referer
    else
      @drink = Drink.find(params[:beverage][:drink_id])
      @beverage = Beverage.new(beverage_params)
      @beverage.drink = @drink

      respond_to do |format|
        if @beverage.save
          PartyChannel.broadcast_to(
            @party,
            render_to_string(partial: "buddy.html", locals: { users: @party.users, party: @party })
          )
          format.html { redirect_to request.referer }
          format.json { render json: json_response }
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
    @meeting = @beverage.meeting
    @party = @meeting.party
    authorize(@beverage)
    respond_to do |format|
      if @beverage.destroy
        PartyChannel.broadcast_to(
          @party,
          render_to_string(partial: "buddy.html", locals: { users: @party.users, party: @party })
        )
        format.json { render json: json_response }
      end
    end
    # redirect_to request.referer
  end

  def calculate_rates
    @alcool_rate = @meeting.sobriaty[:alcool_rate]
    @time_to_dedrunk = @meeting.sobriaty[:time_format]
  end

  private

  def beverage_params
    params.require(:beverage).permit(:meeting_id, :drink_id)
  end

  def json_response
    calculate_rates

    {
      editable_list_partial: render_to_string(partial: 'beverages/list.html', locals: { beverages: @meeting.beverages, editable: true }),
      list_partial: render_to_string(partial: 'beverages/list.html', locals: { beverages: @meeting.beverages, editable: false }),
      alcool_rate_partial: render_to_string(partial: 'parties/alcool_rate.html', locals: { alcool_rate: @alcool_rate, is_in_modal: false }),
      alcool_rate_partial_in_modal: render_to_string(partial: 'parties/alcool_rate.html', locals: { alcool_rate: @alcool_rate, is_in_modal: true }),
      time_to_dedrunk_partial: @time_to_dedrunk
    }
  end
end
