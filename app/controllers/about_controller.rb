class AboutController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def about

  end

  def contact

  end

  def terms

  end
end