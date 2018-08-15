require 'test_helper'

class TransactionHistoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get transaction_histories_index_url
    assert_response :success
  end

  test "should get new" do
    get transaction_histories_new_url
    assert_response :success
  end

  test "should get create" do
    get transaction_histories_create_url
    assert_response :success
  end

end
