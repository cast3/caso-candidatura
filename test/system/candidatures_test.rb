require "application_system_test_case"

class CandidaturesTest < ApplicationSystemTestCase
  setup do
    @candidature = candidatures(:one)
  end

  test "visiting the index" do
    visit candidatures_url
    assert_selector "h1", text: "Candidatures"
  end

  test "should create candidature" do
    visit candidatures_url
    click_on "New candidature"

    fill_in "Candidate", with: @candidature.candidate_id
    fill_in "Codeinscription", with: @candidature.codeInscription
    fill_in "Dateinscription", with: @candidature.dateInscription
    fill_in "Municipality", with: @candidature.municipality_id
    fill_in "Party", with: @candidature.party_id
    fill_in "Period", with: @candidature.period_id
    click_on "Create Candidature"

    assert_text "Candidature was successfully created"
    click_on "Back"
  end

  test "should update Candidature" do
    visit candidature_url(@candidature)
    click_on "Edit this candidature", match: :first

    fill_in "Candidate", with: @candidature.candidate_id
    fill_in "Codeinscription", with: @candidature.codeInscription
    fill_in "Dateinscription", with: @candidature.dateInscription
    fill_in "Municipality", with: @candidature.municipality_id
    fill_in "Party", with: @candidature.party_id
    fill_in "Period", with: @candidature.period_id
    click_on "Update Candidature"

    assert_text "Candidature was successfully updated"
    click_on "Back"
  end

  test "should destroy Candidature" do
    visit candidature_url(@candidature)
    click_on "Destroy this candidature", match: :first

    assert_text "Candidature was successfully destroyed"
  end
end
