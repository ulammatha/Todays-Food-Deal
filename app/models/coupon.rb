require 'securerandom'
class Coupon < ActiveRecord::Base
  belongs_to :user
  belongs_to :deal
  belongs_to :payment

  after_save do
    self.deal.update_sold_coupons
  end
end
