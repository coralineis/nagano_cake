require "test_helper"

class Public::GenresControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_genres_show_url
    assert_response :success
  end
end
