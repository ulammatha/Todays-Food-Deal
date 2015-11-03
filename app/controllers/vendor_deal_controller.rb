class VendorDealController < ApplicationController
  before_action :authenticate_user!, only:[:index, :new,:create, :edit, :update]
  before_action do
    unless current_user && current_user.is_vendor?
     flash[:notice] = "no access hence redirect to home page"
      redirect_to :root
    end
  end

  before_action only: [:new, :edit, :create, :update] do
    @eateries = current_user.eateries
  end

  def index
    eatery_ids = current_user.eateries.pluck(:id)
    @deals = Deal.where(eatery_id: eatery_ids)
    render 'deal/index'
  end


  def new
    @deal= Deal.new
  end

  def create
    @deal = Deal.new(deal_params)
    if @deal.save
      flash[:success] = 'Deal was successfully added.'
      redirect_to action: 'index'
    else
      render :new
    end
  end

  def edit
    @deal = Deal.find(params[:id])
  end

  def update
    @deal = Deal.find(params[:id])
    if @deal.update_attributes(deal_params)
      redirect_to root_path, flash:{success: "Deal updated Successfully"}
    else
      render :edit
    end
  end

  def destroy
    @deal = Deal.find(params[:id])
    if @deal.present?
      @deal.destroy
      flash[:success] = "Deal destroyed Successfully"
    else
      flash[:warning] = "Deal could not be deleted"
    end
    redirect_to root_path
  end

  private

  def deal_params
    params.require(:deal).permit(:name, :description, :current_amount, :previous_amount, :expiry,:coupon_code,
      :available_coupons, :image, :eatery_id)
  end
end
