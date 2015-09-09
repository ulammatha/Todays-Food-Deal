# EateryController - lists deals from various restaurants and can create new deals.
class EateryController < ApplicationController
  before_action :authenticate_user! , only:[:index, :new,:create, :edit, :update]

  def index
    @eateries = current_user.eateries.all
  end

  def new
    @eatery= Eatery.new
  end

  def create
   @eatery = Eatery.new(eatery_params)
    if @eatery.save
      redirect_to eatery_index_path, flash:{success: "Registered Successfully", notice: "Now you can add deals"}
    else
      render :new
    end
  end

  def edit
    @eatery = Eatery.find(params[:id])

  end

  def update
    @eatery = Eatery.find(params[:id])
    if @eatery.update_attributes(eatery_params)
      redirect_to eatery_index_path, flash:{success: "updated Successfully"}
    else
      render :edit
    end
  end

  def eatery_params
    params.require(:eatery).permit(:eatery_name, :eatery_description, :eatery_contact, :eatery_email, :eatery_address, :image, :user_id)
  end

end
