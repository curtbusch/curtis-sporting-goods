require 'test_helper'

class AddressControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get address_new_url
    assert_response :success
  end

end
