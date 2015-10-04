require 'securerandom'
class Coupon < ActiveRecord::Base
  searchkick
  belongs_to :user
  belongs_to :deal
  belongs_to :payment

  after_save do
    self.deal.update_sold_coupons
  end

  def coupon_status
  	return 'Active' if status

  	'Redeemed'
  end
end
