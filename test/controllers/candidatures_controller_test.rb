require "test_helper"

class CandidaturesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @candidature = candidatures(:one)
  end

  test "should get index" do
    get candidatures_url
    assert_response :success
  end

  test "should get new" do
    get new_candidature_url
    assert_response :success
  end

  test "should create candidature" do
    assert_difference("Candidature.count") do
      post candidatures_url, params: { candidature: { candidate_id: @candidature.candidate_id, codeInscription: @candidature.codeInscription, dateInscription: @candidature.dateInscription, municipality_id: @candidature.municipality_id, party_id: @candidature.party_id, period_id: @candidature.period_id } }
    end

    assert_redirected_to candidature_url(Candidature.last)
  end

  test "should show candidature" do
    get candidature_url(@candidature)
    assert_response :success
  end

  test "should get edit" do
    get edit_candidature_url(@candidature)
    assert_response :success
  end

  test "should update candidature" do
    patch candidature_url(@candidature), params: { candidature: { candidate_id: @candidature.candidate_id, codeInscription: @candidature.codeInscription, dateInscription: @candidature.dateInscription, municipality_id: @candidature.municipality_id, party_id: @candidature.party_id, period_id: @candidature.period_id } }
    assert_redirected_to candidature_url(@candidature)
  end

  test "should destroy candidature" do
    assert_difference("Candidature.count", -1) do
      delete candidature_url(@candidature)
    end

    assert_redirected_to candidatures_url
  end
end
