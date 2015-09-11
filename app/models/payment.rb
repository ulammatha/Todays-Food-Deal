class Payment < ActiveRecord::Base
  belongs_to :user
  belongs_to :deal
  has_one :coupon
end
