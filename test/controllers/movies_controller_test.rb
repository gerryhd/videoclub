require 'test_helper'

class MoviesControllerTest < ActionDispatch::IntegrationTest
  test "should get make_a_rent" do
    get movies_make_a_rent_url
    assert_response :success
  end

end
