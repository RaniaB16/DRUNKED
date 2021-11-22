class PartiesController < ApplicationController

  def create
    @party = Party.new
    authorize(@party)
  end
end
