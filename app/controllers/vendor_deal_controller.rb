class VendorDealController < ApplicationController
  before_action do
    unless current_user && current_user.is_vendor?
      redirect_to(:root, notice: "unauthorized to access")
    end
  end
  before_action only: [:new, :edit, :create, :update] do
    @eateries = current_user.eateries
  end

  respond_to :html, only: [:index, :new, :create, :edit, :update, :destroy]

  def index
    eatery_ids = current_user.eateries.pluck(:id)
    if params[:search]
      @deals = Deal.search params[:search], where: {eatery_id: eatery_ids}, fields: [:name]
    else
      @deals = Deal.where(eatery_id: eatery_ids)
    end
    render 'shared/deal_index'
  end

  def new
    @deal= Deal.new
  end

  def create
    @deal = Deal.new(deal_params)
    if @deal.save
      flash[:success] = 'Deal created successfully.'
    end
    respond_with(@deal, location: root_path)
  end

  def edit
    @deal = Deal.find(params[:id])
  end

  def update
    @deal = Deal.find(params[:id])
    if @deal.update_attributes(deal_params)
      flash[:success] = "Deal updated Successfully."
    end
    respond_with(@deal, location: root_path)
  end

  def destroy
    @deal = Deal.find(params[:id])
    @deal.update!(deleted_at: Time.zone.now)
    flash[:success] = "Deal destroyed Successfully"
    respond_with(@deal, location: root_path)
  end

  private

  def deal_params
    params.require(:deal).
      permit(
        :name,
        :description,
        :current_amount,
        :previous_amount,
        :expiry,
        :coupon_code,
        :available_coupons,
        :image,
        :eatery_id,
        :deleted_at
      )
  end
end
