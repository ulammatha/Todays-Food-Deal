class ChargesController < ApplicationController

  def create
    # Amount in cents
    amount = params[:payment][:amount].to_i * 100
    email = params[:stripeEmail]
    deal_id = params[:payment][:deal_id]
    customer = Stripe::Customer.create(
      email: email,
      card: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: amount,
      description: "Rails Stripe customer",
      currency: "usd"
    )
    params[:payment][:user_id] = current_user.id
    params[:payment][:stripe_token] = params[:stripeToken]
    params[:payment][:transaction_status] = charge.status
    payment = Payment.new(payment_params)
    if payment.save
      coupon = CouponGeneration.new(
        current_user.id,
        deal_id,
        payment.id
      ).create_coupon

      flash[:success] = "your payment $#{amount / 100} "\
        "has been successfully processed and "\
        "coupon_code is: #{coupon.code}"

      redirect_to "/"
    end

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end

  private

  def payment_params
    params.require(:payment).
      permit(
        :user_id,
        :deal_id,
        :amount,
        :stripe_token,
        :transaction_status
      )
  end
end
