require 'test_helper'

class RetailersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @retailer = retailers(:one)
  end

  test "should get index" do
    get retailers_url, as: :json
    assert_response :success
  end

  test "should create retailer" do
    assert_difference('Retailer.count') do
      post retailers_url, params: { retailer: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show retailer" do
    get retailer_url(@retailer), as: :json
    assert_response :success
  end

  test "should update retailer" do
    patch retailer_url(@retailer), params: { retailer: {  } }, as: :json
    assert_response 200
  end

  test "should destroy retailer" do
    assert_difference('Retailer.count', -1) do
      delete retailer_url(@retailer), as: :json
    end

    assert_response 204
  end
end
