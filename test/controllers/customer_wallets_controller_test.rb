require 'test_helper'

class CustomerWalletsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customer_wallets_index_url
    assert_response :success
  end

  test "should get new" do
    get customer_wallets_new_url
    assert_response :success
  end

  test "should get create" do
    get customer_wallets_create_url
    assert_response :success
  end

  test "should get delete" do
    get customer_wallets_delete_url
    assert_response :success
  end

end
