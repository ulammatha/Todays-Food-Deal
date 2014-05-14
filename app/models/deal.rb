class Deal < ActiveRecord::Base
  belongs_to :eatery
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  do_not_validate_attachment_file_type :image
  validates :recipe_name, presence: true
  validates :description, presence: true
  validates :current_amount, :numericality => {:greater_than => 0}, :format => { :with => /\A\d+??(?:\.\d{0,2})?\Z/ }
  validates :previous_amount, :numericality => {:greater_than => 0}, :format => { :with => /\A\d+??(?:\.\d{0,2})?\Z/ } 
  validates :discount, presence: true , numericality: true
  validates :expiry, presence: true
  validates :coupon_code, presence: true
  validates :available_coupons, presence: true, numericality: true
  validates :image, presence: true
end
