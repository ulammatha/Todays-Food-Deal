class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :twitter]
  has_many :eateries
  has_many :coupons, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_attached_file :image,
  :styles => {
  :small  => "150x150>"}
  do_not_validate_attachment_file_type :image

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email || user.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name
      # user.image = process_uri(auth.info.image)
    end
  end

  def self.process_uri(uri)
   avatar_url = URI.parse(uri)
   avatar_url.scheme = 'https'
   avatar_url.to_s
  end
end
