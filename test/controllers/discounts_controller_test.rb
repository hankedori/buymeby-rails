require 'test_helper'

class DiscountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @discount = discounts(:one)
  end

  test "should get index" do
    get discounts_url, as: :json
    assert_response :success
  end

  test "should create discount" do
    assert_difference('Discount.count') do
      post discounts_url, params: { discount: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show discount" do
    get discount_url(@discount), as: :json
    assert_response :success
  end

  test "should update discount" do
    patch discount_url(@discount), params: { discount: {  } }, as: :json
    assert_response 200
  end

  test "should destroy discount" do
    assert_difference('Discount.count', -1) do
      delete discount_url(@discount), as: :json
    end

    assert_response 204
  end
end
