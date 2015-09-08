require 'test_helper'

class PurchasedControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
