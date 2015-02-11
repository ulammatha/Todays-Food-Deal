class DealController < ApplicationController
  #
  def index
    @deals=Deal.search(params[:search])
  end

  def show
    @deal= Deal.find(params[:id])
    #respond_to do |format|
      #format.html {send_data "text"}
      #format.csv { send_data '<p> no file </p>'}
    #end
  end

  def new
    @deal= Deal.new
  end

  def create

   @deal = Deal.new(deal_params)
    if @deal.save

     redirect_to action: 'index', notice: 'deal was successfully added.'
    else
      render :new
    end
  end

  def edit
  end

  def deals
  end

    def deal_params
        params.require(:deal).permit(:recipe_name, :description, :current_amount, :discount, :previous_amount, :expiry,:coupon_code,
          :available_coupons, :image)
    end

end
