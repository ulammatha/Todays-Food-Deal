class DealController < ApplicationController
  before_action :authenticate_user! , only:[:index, :new,:create, :edit, :update]
  before_action do
    redirect_to :root_path unless current_user && current_user.is_vendor?
  end
  #
  def index
    #searchkick
    @deals=Deal.all

  end

  def show
    @deal= Deal.find(params[:id])
    #respond_to do |format|
      #format.html {send_data "text"}
      #format.csv { send_data '<p> no file </p>'}
    #end
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

  # def edit
  # end

  # def deals
  # end

  def search
    @deals=Deal.search params[:search]
    render :index
  end

  def deal_params
    params.require(:deal).permit(:name, :description, :current_amount, :previous_amount, :expiry,:coupon_code,
      :available_coupons, :image, :eatery_id)
  end

end
