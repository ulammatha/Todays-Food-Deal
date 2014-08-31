class Eatery < ActiveRecord::Base
  has_many :deals
  belongs_to :user
  has_attached_file :image,
  :styles => {
  :tiny => "25x25#",
  :thumbnail => "100x100#",
  :small  => "150x150>",
  :medium => "300x300>" },
  :default_url => "/images/logo.png"

  do_not_validate_attachment_file_type :image
  validates :eatery_name, presence: true
  validates :eatery_description, presence: true
  validates :eatery_contact, presence: true
  validates :eatery_email, presence: true,:format => { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create }
  validates :eatery_address, presence: true
  validates :image, presence: true

end
