require 'test_helper'

class OperationalHoursControllerTest < ActionDispatch::IntegrationTest
  setup do
    @operational_hour = operational_hours(:one)
  end

  test "should get index" do
    get operational_hours_url, as: :json
    assert_response :success
  end

  test "should create operational_hour" do
    assert_difference('OperationalHours.count') do
      post operational_hours_url, params: { operational_hour: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show operational_hour" do
    get operational_hour_url(@operational_hour), as: :json
    assert_response :success
  end

  test "should update operational_hour" do
    patch operational_hour_url(@operational_hour), params: { operational_hour: {  } }, as: :json
    assert_response 200
  end

  test "should destroy operational_hour" do
    assert_difference('s.count', -1) do
      delete operational_hour_url(@operational_hour), as: :json
    end

    assert_response 204
  end
end
