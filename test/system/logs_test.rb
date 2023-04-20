require "application_system_test_case"

class LogsTest < ApplicationSystemTestCase
  setup do
    @log = logs(:one)
  end

  test "visiting the index" do
    visit logs_url
    assert_selector "h1", text: "Logs"
  end

  test "should create log" do
    visit logs_url
    click_on "New log"

    fill_in "Air filter change", with: @log.air_filter_change
    fill_in "Breaks liquid change", with: @log.breaks_liquid_change
    fill_in "Cabin filter change", with: @log.cabin_filter_change
    fill_in "Chain grm change", with: @log.chain_grm_change
    fill_in "Driver lisence expiration", with: @log.driver_lisence_expiration
    fill_in "Driving belt change", with: @log.driving_belt_change
    fill_in "Ensuranse expiration", with: @log.ensuranse_expiration
    fill_in "Freeze liquid change", with: @log.freeze_liquid_change
    fill_in "Inspection", with: @log.inspection
    fill_in "Oil change", with: @log.oil_change
    fill_in "Oil filter change", with: @log.oil_filter_change
    fill_in "Registration number", with: @log.registration_number
    fill_in "Water removal", with: @log.water_removal
    click_on "Create Log"

    assert_text "Log was successfully created"
    click_on "Back"
  end

  test "should update Log" do
    visit log_url(@log)
    click_on "Edit this log", match: :first

    fill_in "Air filter change", with: @log.air_filter_change
    fill_in "Breaks liquid change", with: @log.breaks_liquid_change
    fill_in "Cabin filter change", with: @log.cabin_filter_change
    fill_in "Chain grm change", with: @log.chain_grm_change
    fill_in "Driver lisence expiration", with: @log.driver_lisence_expiration
    fill_in "Driving belt change", with: @log.driving_belt_change
    fill_in "Ensuranse expiration", with: @log.ensuranse_expiration
    fill_in "Freeze liquid change", with: @log.freeze_liquid_change
    fill_in "Inspection", with: @log.inspection
    fill_in "Oil change", with: @log.oil_change
    fill_in "Oil filter change", with: @log.oil_filter_change
    fill_in "Registration number", with: @log.registration_number
    fill_in "Water removal", with: @log.water_removal
    click_on "Update Log"

    assert_text "Log was successfully updated"
    click_on "Back"
  end

  test "should destroy Log" do
    visit log_url(@log)
    click_on "Destroy this log", match: :first

    assert_text "Log was successfully destroyed"
  end
end
