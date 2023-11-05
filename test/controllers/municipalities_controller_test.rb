require "test_helper"

class MunicipalitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @municipality = municipalities(:muni)
  end

  test "should get new" do
    get new_municipality_url
    assert_response :success
  end

  test "should search and no found municipality" do
    get buscar_municipalities_url('No exists')
    assert_redirected_to municipalities_url
  end

  test "should search and redirect to municipality when found" do
    get buscar_municipalities_url(parametro: @municipality.daneCode)

    assert_response :success
    assert_template 'show'
    assert_equal @municipality, assigns(:municipality)
  end

  test "should create municipality" do
    assert_difference("Municipality.count") do
      post municipalities_url, params: { municipality: { daneCode: @municipality.daneCode, name: @municipality.name } }
    end

    assert_redirected_to municipality_url(Municipality.last)
  end

  test "should show municipality" do
    get municipality_url(@municipality)
    assert_response :success
  end

end
