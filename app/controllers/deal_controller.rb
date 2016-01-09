class DealController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action do
    redirect_to vendor_deal_index_path(search: params[:search]) if vendor?
  end

  def index
    if params[:search].to_s.strip.length == 0
      @deals = Deal.where(deleted_at: nil)
    else
      @deals = Deal.search params[:search], fields: [:name]
    end
    render 'shared/deal_index'
  end

  def show
    @deal= Deal.find(params[:id])
  end

  private

  def vendor?
    current_user && current_user.is_vendor
  end
end
