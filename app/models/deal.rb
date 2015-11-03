class Deal < ActiveRecord::Base
  searchkick
  belongs_to :eatery
  has_many :coupons
  has_many :reviews, dependent: :destroy

  has_attached_file :image,
  :styles => {
  :thumbnail => "100x100#",
  :medium => "300x300>" }
  do_not_validate_attachment_file_type :image
  validates :name, presence: true
  validates :description, presence: true
  validates :current_amount, :numericality => {:greater_than => 0, message: :error_message}, :format => { :with => /\A\d+??(?:\.\d{0,2})?\Z/ }
  validates :previous_amount, :numericality => {:greater_than => 0, message: :error_message}, :format => { :with => /\A\d+??(?:\.\d{0,2})?\Z/ }
  validates :expiry, presence: true
  validates :available_coupons, presence: true, numericality: true
  validates :image, presence: true
  validates :eatery_id, presence: true
  validate :find_restaurant

  def find_restaurant
    eatery = Eatery.find_by(id: self.eatery_id)
    errors.add(:eatery_id, "invalid resturant slection") if eatery.nil?
  end

  # once coupon is generated, updating sold_coupons attribute
  def update_sold_coupons
    self.increment!(:sold_coupons)
  end
end
