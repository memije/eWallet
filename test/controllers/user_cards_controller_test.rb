require 'test_helper'

class UserCardsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_cards_index_url
    assert_response :success
  end

  test "should get new" do
    get user_cards_new_url
    assert_response :success
  end

  test "should get create" do
    get user_cards_create_url
    assert_response :success
  end

  test "should get update" do
    get user_cards_update_url
    assert_response :success
  end

  test "should get destroy" do
    get user_cards_destroy_url
    assert_response :success
  end

end
