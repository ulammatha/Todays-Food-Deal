class VendorDealController < ApplicationController
  before_action :authenticate_user!, only:[:index, :new,:create, :edit, :update]
  before_action do
    unless current_user && current_user.is_vendor?
     flash[:notice] = "no access hence redirect to home page"
      redirect_to :root
    end
  end
  before_action only: :index do
    helper_method :deal_expiry
  end
  def index
    eatery_ids = current_user.eateries.pluck(:id)
    @deals = Deal.where(eatery_id: eatery_ids)
    render 'deal/index'
  end


  def new
    @eateries = current_user.eateries
    @deal= Deal.new
  end

  def create
    @deal = Deal.new(deal_params)
    if @deal.save
      flash[:success] = 'deal was successfully added.'
      redirect_to action: 'index'
    else
      @eateries = current_user.eateries
      render :new
    end
  end

  def edit

  end

  def update

  end
  private

  def deal_params
    params.require(:deal).permit(:name, :description, :current_amount, :previous_amount, :expiry,:coupon_code,
      :available_coupons, :image, :eatery_id)
  end
end
