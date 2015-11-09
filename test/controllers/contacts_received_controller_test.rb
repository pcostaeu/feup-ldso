require 'test_helper'

class ContactsReceivedControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
