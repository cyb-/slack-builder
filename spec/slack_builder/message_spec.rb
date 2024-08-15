# frozen_string_literal: true

require 'spec_helper'

RSpec.describe SlackBuilder::Message do
  subject(:message) { described_class.new(&blocks) }

  include_context 'with all blocks'

  describe '#to_a' do
    subject { message.to_a }

    it { is_expected.to eq(expected_blocks) }
  end

  describe '#to_ary' do
    subject { message.to_ary }

    it { is_expected.to eq(message.to_a) }
  end

  describe '#to_h' do
    subject { message.to_h }

    let(:expected_payload) do
      {
        blocks: expected_blocks,
      }
    end

    it { is_expected.to eq(expected_payload) }

    context 'with text' do
      let(:text) { '*Hello* world :wave:' }

      let(:message) { described_class.new(text, &blocks) }

      let(:expected_payload) do
        {
          text: text,
          blocks: expected_blocks,
        }
      end

      it { is_expected.to eq(expected_payload) }
    end

    context 'with attachments' do
      let(:expected_attachments) do
        [
          {
            color: 'warning',
            blocks: [
              {
                type: 'rich_text',
                elements: [
                  {
                    type: 'rich_text_section',
                    elements: [
                      {
                        type: 'text',
                        text: 'Hello',
                      },
                      {
                        type: 'broadcast',
                        range: 'here',
                      },
                      {
                        type: 'emoji',
                        name: 'robot_face',
                      },
                    ],
                  },
                ],
              },
              {
                type: 'image',
                image_url: 'https://media.giphy.com/media/cYNjbM2MvPzM8raKvh/giphy.gif',
                alt_text: 'Who',
              },
            ],
          },
        ]
      end

      let(:expected_payload) do
        {
          attachments: expected_attachments,
          blocks: expected_blocks,
        }
      end

      before do
        message.attachment color: :warning do
          rich_text do
            section do
              text 'Hello'
              broadcast :here
              emoji :robot_face
            end
          end
          image 'https://media.giphy.com/media/cYNjbM2MvPzM8raKvh/giphy.gif', alt_text: 'Who'
        end
      end

      it { is_expected.to eq(expected_payload) }
    end
  end

  describe '#to_hash' do
    subject { message.to_hash }

    it { is_expected.to eq(message.to_h) }
  end

  describe '#as_json' do
    subject { message.as_json }

    it { is_expected.to eq(message.to_h) }
  end
end
