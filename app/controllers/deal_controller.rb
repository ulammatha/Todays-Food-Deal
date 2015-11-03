class DealController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:search].to_s.strip.length == 0
      @deals = Deal.all
    else
      @deals = Deal.search params[:search]
    end
  end

  def show
    @deal= Deal.find(params[:id])
  end
end
