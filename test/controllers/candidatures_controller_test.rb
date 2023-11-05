require "test_helper"

class CandidaturesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @candidature = candidatures(:cand)
    @parties_ids = Party.pluck(:id)
  end

  test "should get new" do
    get new_candidature_url
    assert_response :success
  end

  test "should search and not find candidature" do
    get buscar_candidatures_url('No exists')
    assert_redirected_to candidatures_url
  end

  test "should search and redirect to candidature when found" do
    get buscar_candidatures_url(parametro: @candidature.codeInscription)

    assert_response :success
    assert_template 'show'
    assert_equal @candidature, assigns(:candidature)
  end

  test "should create candidature" do
    assert_difference("Candidature.count") do
      post candidatures_url, params: { candidature: {
        candidate_id: @candidature.candidate_id,
        codeInscription: @candidature.codeInscription,
        dateInscription: @candidature.dateInscription,
        municipality_id: @candidature.municipality_id,
        period_id: @candidature.period_id,
        party_ids: @parties_ids
      } }
    end

    assert_redirected_to candidature_url(Candidature.last)
  end

  test "should show candidature" do
    get candidature_url(@candidature)
    assert_response :success
  end
end
