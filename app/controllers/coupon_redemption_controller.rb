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
      @coupons = Coupon.search params[:coupon_id], fields: [:code]
  end
 end

 def update
  coupon = Coupon.find_by(id: params[:id])
  if coupon.status
    coupon.update(status: false);
    flash[:success] = "Successfully redeemed coupon"
    redirect_to coupon_redemption_index_path
  end
 end
end
