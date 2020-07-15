require 'test_helper'

class HomePagesControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @base_title = "タビナビ"
  end

  
  test "should get home" do
    get home_pages_home_url
    assert_response :success
     assert_select "title", "タビナビ"
  end

end
