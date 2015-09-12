class CouponGeneration
  attr_accessor :user_id, :deal_id, :code, :payment_id

  def initialize(user_id, deal_id, payment_id)
    @user_id = user_id
    @deal_id = deal_id
    @code = generate_coupon
    @payment_id = payment_id
  end

  def create_coupon
    Coupon.create(
      user_id: user_id,
      deal_id: deal_id,
      code: code,
      payment_id: payment_id
    )
  end

  private

  def generate_coupon
    loop do
      random_token = SecureRandom.hex(4)  # 4 gengrate 8char length string
      break random_token unless Coupon.exists?(code: random_token)
    end
  end
end