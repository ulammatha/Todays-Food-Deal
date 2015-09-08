class ChargesController < ApplicationController


def new
end

def create
  # Amount in cents
  amount = params[:stripeAmount].to_i * 100
  email = params[:stripeEmail]
  customer = Stripe::Customer.create(
    :email => email,
    :card  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => amount,
    :description => 'Rails Stripe customer',
    :currency    => 'usd'
  )

  payment_create(charge.status)

  flash[:success] = "your payment $#{amount/100} has been successfully processed"
  redirect_to "/"

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to charges_path
end
end

private

def payment_create(charge_status)
  payment = Payment.create(
    user_id: current_user.id,
    deal_id: params[:deal_id],
    stripe_token: params[:stripeToken],
    transaction_status: charge_status
    )
  payment.save!
end
