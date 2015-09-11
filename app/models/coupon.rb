require 'securerandom'
class Coupon < ActiveRecord::Base
  belongs_to :user
  belongs_to :deal
  belongs_to :payment
end
