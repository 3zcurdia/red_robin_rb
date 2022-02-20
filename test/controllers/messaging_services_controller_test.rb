# frozen_string_literal: true

require "test_helper"

class MessagingServicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @messaging_service = create(:messaging_service)
  end

  test "should get index" do
    get messaging_services_url
    assert_response :success
  end

  test "should get new" do
    get new_messaging_service_url
    assert_response :success
  end

  test "should create messaging_service" do
    assert_difference("MessagingService.count") do
      post messaging_services_url, params: { messaging_service: attributes_for(:messaging_service) }
    end

    assert_redirected_to messaging_service_url(MessagingService.order(:created_at).last)
  end

  test "should show messaging_service" do
    get messaging_service_url(@messaging_service)
    assert_response :success
  end

  test "should get edit" do
    get edit_messaging_service_url(@messaging_service)
    assert_response :success
  end

  test "should update messaging_service" do
    patch messaging_service_url(@messaging_service),
          params: { messaging_service: { alias_name: @messaging_service.alias_name,
                                         webhook_url: @messaging_service.webhook_url } }
    assert_redirected_to messaging_service_url(@messaging_service)
  end

  test "should destroy messaging_service" do
    assert_difference("MessagingService.count", -1) do
      delete messaging_service_url(@messaging_service)
    end

    assert_redirected_to messaging_services_url
  end
end
