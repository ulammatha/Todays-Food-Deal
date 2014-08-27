# EateryController - lists deals from various restaurants and can create new deals.
class EateryController < ApplicationController
  before_action :authenticate_user! , only:[:new,:create]

  def new
    user = User.find(current_user.id) if current_user
    reg_restaurant = Eatery.where(user_id: user.id).first if user
    if user.present? && reg_restaurant.present?
      redirect_to new_deal_path
    else
    @eatery= Eatery.new
    end
  end

  def create
   @eatery = Eatery.new(eatery_params)
   @eatery.user_id = current_user.id
    if @eatery.save
      redirect_to new_deal_path
    else
      redirect_to eatery_index_path
    end
  end

  def eatery_params
      params.require(:eatery).permit(:eatery_name, :eatery_description, :eatery_contact, :eatery_email, :eatery_address, :image, :user_id)
  end

end
