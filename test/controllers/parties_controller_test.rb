require "test_helper"

class PartiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @party = parties(:party)
  end

  test "should get new" do
    get new_party_url
    assert_response :success
  end

  test "should search and not find party" do
    get buscar_parties_url('No exists')
    assert_redirected_to parties_url
  end

  test "should search and redirect to party when found" do
    get buscar_parties_url(parametro: @party.identification)

    assert_response :success
    assert_template 'show'
    assert_equal @party, assigns(:party)
  end

  test "should create party" do
    assert_difference("Party.count") do
      post parties_url, params: { party: {
        identification: @party.identification,
        name: @party.name
      } }
    end

    assert_redirected_to party_url(Party.last)
  end

  test "should show party" do
    get party_url(@party)
    assert_response :success
  end
end
