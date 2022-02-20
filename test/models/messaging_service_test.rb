# frozen_string_literal: true

require "test_helper"

class MessagingServiceTest < ActiveSupport::TestCase
  def messaging_service
    @messaging_service ||= build(:messaging_service)
  end

  test "fixture must be valid" do
    assert messaging_service.valid?
  end
end
