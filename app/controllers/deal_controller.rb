class DealController < ApplicationController

  # before_action only: :index do
  #   redirect_to :vendor_deal_index if current_user && current_user.is_vendor?
  # end

  def index
    if params[:search].to_s.strip.length == 0
      @deals=Deal.all
    else
      @deals = Deal.search params[:search]
    end
  end

  def show
    @deal= Deal.find(params[:id])
  end

end
