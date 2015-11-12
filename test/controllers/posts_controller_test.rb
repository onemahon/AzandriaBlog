require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  setup do
    @post = posts(:published)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  test 'should show post' do
    get :show, id: @post
    assert_response :success
  end

  test 'should not show unpublished post' do
    assert_raises(ActiveRecord::RecordNotFound) do
      get :show, id: posts(:unpublished)
    end
  end
end
