class PurchasedController < ApplicationController
  def index
    @payments = Payment.where(user_id: current_user.id)
  end
end
