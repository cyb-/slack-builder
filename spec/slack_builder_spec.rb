# frozen_string_literal: true

require 'spec_helper'

RSpec.describe SlackBuilder do
  it 'has a version number' do
    expect(SlackBuilder::VERSION).not_to be_nil
  end

  it 'builds an attachment' do
    expect(described_class.attachment).to be_a(SlackBuilder::Attachment)
  end

  it 'builds a Slack message' do
    expect(described_class.message).to be_a(SlackBuilder::Message)
  end
end
