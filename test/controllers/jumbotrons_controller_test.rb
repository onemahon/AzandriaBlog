require 'test_helper'

class JumbotronsControllerTest < ActionController::TestCase
  setup do
    @jumbotron = jumbotrons(:day)
  end

  test 'should show jumbotron' do
    get :show, id: @jumbotron
    assert_response :success
  end
end
