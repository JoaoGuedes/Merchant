require 'test_helper'

class MessengersControllerTest < ActionController::TestCase
  setup do
    @messenger = messengers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:messengers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create messenger" do
    assert_difference('Messenger.count') do
      post :create, messenger: @messenger.attributes
    end

    assert_redirected_to messenger_path(assigns(:messenger))
  end

  test "should show messenger" do
    get :show, id: @messenger.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @messenger.to_param
    assert_response :success
  end

  test "should update messenger" do
    put :update, id: @messenger.to_param, messenger: @messenger.attributes
    assert_redirected_to messenger_path(assigns(:messenger))
  end

  test "should destroy messenger" do
    assert_difference('Messenger.count', -1) do
      delete :destroy, id: @messenger.to_param
    end

    assert_redirected_to messengers_path
  end
end
