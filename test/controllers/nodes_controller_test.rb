require 'test_helper'

class NodesControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @user = FactoryGirl.create(:user)
    @node = FactoryGirl.create(:node)
    @node.user = @user
    @node.save
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:nodes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create node" do
    assert_difference('Node.count') do
      node = FactoryGirl.attributes_for(:node)
      post :create, node: node
    end

    assert_redirected_to node_path(assigns(:node))
  end

  test "should show node" do
    get :show, id: @node
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @node
    assert_response :success
  end

  test "should update node" do
    patch :update, id: @node, node: { mac_address: @node.mac_address, pub_key: @node.pub_key, user_id: @node.user_id }
    assert_redirected_to node_path(assigns(:node))
  end

  test "should destroy node" do
    assert_difference('Node.count', -1) do
      delete :destroy, id: @node
    end

    assert_redirected_to nodes_path
  end
end
