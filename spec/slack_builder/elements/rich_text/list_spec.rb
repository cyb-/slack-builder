# frozen_string_literal: true

require 'spec_helper'

RSpec.describe SlackBuilder::Elements::RichText::List do
  subject(:element) { described_class.new(:bullet, &blocks) }

  let(:blocks) do
    proc do
      section do
        text 'Hello'
      end
      section do
        link 'world', url: 'https://example.com'
      end
      section do
        emoji :wave
      end
    end
  end

  let(:expected_blocks) do
    [
      {
        type: 'rich_text_section',
        elements: [
          {
            type: 'text',
            text: 'Hello',
          },
        ],
      },      {
        type: 'rich_text_section',
        elements: [
          {
            type: 'link',
            text: 'world',
            url: 'https://example.com',
            unsafe: false,
          },
        ],
      },      {
        type: 'rich_text_section',
        elements: [
          {
            type: 'emoji',
            name: 'wave',
          },
        ],
      },
    ]
  end

  describe '#to_h' do
    subject { element.to_h }

    let(:expected_payload) do
      {
        type: 'rich_text_list',
        style: 'bullet',
        elements: expected_blocks,
      }
    end

    it { is_expected.to eq(expected_payload) }

    context 'with custom style' do
      let(:element) { described_class.new(:ordered, &blocks) }

      let(:expected_payload) do
        {
          type: 'rich_text_list',
          style: 'ordered',
          elements: expected_blocks,
        }
      end

      it { is_expected.to eq(expected_payload) }
    end
  end

  include_examples 'collection element'
  include_examples 'serializable element'
end
