class Deal < ActiveRecord::Base
  belongs_to :eatery
  has_attached_file :image,
  :styles => {
  :tiny => "25x25#",
  :thumbnail => "100x100#",
  :small  => "150x150>",
  :medium => "300x300>" },
  :default_url => "/images/logo.png"
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
