class CouponRedemptionController < ApplicationController
  before_action do
    unless current_user && current_user.is_vendor?
     flash[:notice] = "no access hence redirect to home page"
      redirect_to :root
    end
  end
 def index
  if params[:coupon_id].to_s.strip.length == 0
      @coupons = Coupon.all
    else
      @coupons = Coupon.search params[:id]
  end
 end

 def show

 end
end
