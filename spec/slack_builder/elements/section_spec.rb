# frozen_string_literal: true

require 'spec_helper'

RSpec.describe SlackBuilder::Elements::Section do
  subject(:element) { described_class.new(&blocks) }

  let(:blocks) do
    proc do
      plain_text 'Hello'
      mrkdwn 'World'
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
    ]
  end

  describe '#to_h' do
    subject { element.to_h }

    let(:expected_attributes) do
      {
        type: 'section',
        fields: expected_blocks,
      }
    end

    it { is_expected.to eq(expected_attributes) }

    context 'with a text' do
      let(:element) { described_class.new('Hello world', verbatim: true, &blocks) }

      let(:expected_attributes) do
        {
          type: 'section',
          text: {
            type: 'mrkdwn',
            text: 'Hello world',
            verbatim: true,
          },
          fields: expected_blocks,
        }
      end

      it { is_expected.to eq(expected_attributes) }
    end

    context 'with an accessory' do
      let(:blocks) do
        proc do
          plain_text 'Hello'
          mrkdwn 'World'

          accessory do
            image 'https://media.giphy.com/media/AcfTF7tyikWyroP0x7/giphy.gif', alt_text: 'Foo bar baz' # ignored
            button 'Click me', url: 'https://example.com'
          end
        end
      end

      let(:expected_attributes) do
        {
          type: 'section',
          fields: expected_blocks,
          accessory: {
            type: 'button',
            text: {
              type: 'plain_text',
              text: 'Click me',
              emoji: true,
            },
            url: 'https://example.com',
          },
        }
      end

      it { is_expected.to eq(expected_attributes) }
    end
  end

  include_examples 'collection element'
  include_examples 'serializable element'
end
