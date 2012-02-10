require 'test_helper'

class TagsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should get tags" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tags)
  end
end
