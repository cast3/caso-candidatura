require "test_helper"

class PeriodsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @period = periods(:period)
  end

  test "should get new" do
    get new_period_url
    assert_response :success
  end

  test "should search and not find period" do
    get buscar_periods_url('No exists')
    assert_redirected_to periods_url
  end

  test "should search and redirect to period when found" do
    get buscar_periods_url(parametro: @period.start_year)

    assert_response :success
    assert_template 'show'
    assert_equal @period, assigns(:period)
  end

  test "should create period" do
    assert_difference("Period.count") do
      post periods_url, params: { period: { end_year: @period.end_year, start_year: @period.start_year } }
    end

    assert_redirected_to period_url(Period.last)
  end

  test "should show period" do
    get period_url(@period)
    assert_response :success
  end
end
