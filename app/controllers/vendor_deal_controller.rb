class VendorDealController < ApplicationController
  before_action :authenticate_user! , only:[:index]
  before_action do
    redirect_to :root_path unless current_user && current_user.is_vendor?
  end
  def index
    eatery_ids = current_user.eateries.pluck(:id)
    @deals = Deal.where(eatery_id: eatery_ids)
    render 'deal/index'
  end
end
