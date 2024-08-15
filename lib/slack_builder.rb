# frozen_string_literal: true

require_relative 'slack_builder/attachment'
require_relative 'slack_builder/message'
require_relative 'slack_builder/version'

module SlackBuilder
  def self.attachment(...)
    Attachment.new(...)
  end

  def self.message(...)
    Message.new(...)
  end
end
