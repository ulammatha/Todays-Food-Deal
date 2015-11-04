class ReviewController < ApplicationController
  before_action :valid_params?, only: [:new, :create]

  def new
    @deal = Deal.find(find_coupon.deal_id)
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to purchase_index_path, flash:{success: "Thank you for the feedback"}
    else
      render :new
    end

  end

  private

  def valid_params?
    find_coupon.present?
  end

  def find_coupon
    @coupon ||= current_user.coupons.find(coupon_id)
  end

  def coupon_id
    params[:purchase_id]
  end

  def review_params
    params.require(:review).permit(:deal_id, :user_id, :rating, :comment)
  end
end
