class LeftNavigationController < ApplicationController
  def index
    SupportMailer.notify_bug.deliver
  end
end
