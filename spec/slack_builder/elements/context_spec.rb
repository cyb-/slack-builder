# frozen_string_literal: true

require 'spec_helper'

RSpec.describe SlackBuilder::Elements::Context do
  subject(:element) { described_class.new(&blocks) }

  let(:blocks) do
    proc do
      plain_text 'Hello'
      mrkdwn 'World'
      image 'https://media.giphy.com/media/AcfTF7tyikWyroP0x7/giphy.gif', alt_text: 'Foo bar baz'
    end
  end

  let(:expected_blocks) do
    [
      {
        type: 'plain_text',
        text: 'Hello',
        emoji: true,
      },
      {
        type: 'mrkdwn',
        text: 'World',
        verbatim: false,
      },
      {
        type: 'image',
        image_url: 'https://media.giphy.com/media/AcfTF7tyikWyroP0x7/giphy.gif',
        alt_text: 'Foo bar baz',
      },
    ]
  end

  describe '#to_h' do
    subject { element.to_h }

    let(:expected_attributes) do
      {
        type: 'context',
        elements: expected_blocks,
      }
    end

    it { is_expected.to eq(expected_attributes) }
  end

  include_examples 'collection element'
  include_examples 'serializable element'
end
