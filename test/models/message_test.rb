# frozen_string_literal: true

require "test_helper"

class MessageTest < ActiveSupport::TestCase
  def message
    @message ||= build(:message)
  end

  test "fixture must be valid" do
    assert message.valid?
  end
end
