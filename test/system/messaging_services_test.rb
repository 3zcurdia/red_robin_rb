# frozen_string_literal: true

require "application_system_test_case"

class MessagingServicesTest < ApplicationSystemTestCase
  setup do
    @messaging_service = messaging_services(:one)
  end

  test "visiting the index" do
    visit messaging_services_url
    assert_selector "h1", text: "Messaging services"
  end

  test "should create messaging service" do
    visit messaging_services_url
    click_on "New messaging service"

    fill_in "Alias", with: @messaging_service.alias
    fill_in "Client", with: @messaging_service.client_id
    fill_in "Client secret", with: @messaging_service.client_secret
    fill_in "Provider", with: @messaging_service.provider
    fill_in "Webhook url", with: @messaging_service.webhook_url
    click_on "Create Messaging service"

    assert_text "Messaging service was successfully created"
    click_on "Back"
  end

  test "should update Messaging service" do
    visit messaging_service_url(@messaging_service)
    click_on "Edit this messaging service", match: :first

    fill_in "Alias", with: @messaging_service.alias
    fill_in "Client", with: @messaging_service.client_id
    fill_in "Client secret", with: @messaging_service.client_secret
    fill_in "Provider", with: @messaging_service.provider
    fill_in "Webhook url", with: @messaging_service.webhook_url
    click_on "Update Messaging service"

    assert_text "Messaging service was successfully updated"
    click_on "Back"
  end

  test "should destroy Messaging service" do
    visit messaging_service_url(@messaging_service)
    click_on "Destroy this messaging service", match: :first

    assert_text "Messaging service was successfully destroyed"
  end
end
