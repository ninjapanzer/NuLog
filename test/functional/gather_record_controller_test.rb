require 'test_helper'

class GatherRecordControllerTest < ActionController::TestCase
  test "should get gather" do
    get :gather
    assert_response :success
  end

end
