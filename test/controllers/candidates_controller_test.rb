require "test_helper"

class CandidatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @candidate = candidates(:candi)
  end

  test "should get new" do
    get new_candidate_url
    assert_response :success
  end

  test "should search and no found candidate" do
    get buscar_candidates_url('No exists')
    assert_redirected_to candidates_url
  end

  test "should search and redirect to patient when found" do
    get buscar_candidates_url(parametro: @candidate.identification )

    assert_response :success
    assert_template 'show'
    assert_equal @candidate, assigns(:candidate)
  end

  test "should create candidate" do
    assert_difference("Candidate.count") do
      post candidates_url, params: { candidate: { identification: @candidate.identification, name: @candidate.name } }
    end

    assert_redirected_to candidate_url(Candidate.last)
  end

  test "should show candidate" do
    get candidate_url(@candidate)
    assert_response :success
  end

end
