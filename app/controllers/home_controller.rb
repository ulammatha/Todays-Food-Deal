class HomeController < ApplicationController
  def index
    @deals=Deal.all
    #binding.pry
  end

  def show
  end 

  def new
    @deal= Deal.new
  end

  def create
   @deal = Deal.new(deal_params)
   binding.pry
    if @deal.save
     redirect_to action: 'index', notice: 'deal was successfully added.' 

    #render action: 'show', status: :created, location:@pin
    else    
    end
  end

  def edit
  end 

  def about
  end

  def contact
  end

  def terms
  end 

  def deals
  end

    def deal_params
        params.require(:deal).permit(:recipe_name, :description, :current_amount, :discount, :previous_amount, :expiry,:coupon_code,
          :available_coupons, :image)
    end

end
