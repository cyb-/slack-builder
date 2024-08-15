# frozen_string_literal: true

require 'spec_helper'

RSpec.describe SlackBuilder::Elements::InteractiveElements::Button do
  subject(:element) { described_class.new('Hello', url: 'https://example.com', emoji: false) }

  describe '#to_h' do
    subject { element.to_h }

    let(:expected_attributes) do
      {
        type: 'button',
        text: {
          type: 'plain_text',
          text: 'Hello',
          emoji: false,
        },
        url: 'https://example.com',
      }
    end

    it { is_expected.to eq(expected_attributes) }

    context 'with a style' do
      let(:element) { described_class.new('Hello', url: 'https://example.com', style: :primary) }

      let(:expected_attributes) do
        {
          type: 'button',
          text: {
            type: 'plain_text',
            text: 'Hello',
            emoji: true,
          },
          url: 'https://example.com',
          style: 'primary',
        }
      end

      it { is_expected.to eq(expected_attributes) }
    end

    context 'with an action_id' do
      let(:element) { described_class.new('Hello', url: 'https://example.com', action_id: 'hello-1234') }

      let(:expected_attributes) do
        {
          type: 'button',
          text: {
            type: 'plain_text',
            text: 'Hello',
            emoji: true,
          },
          url: 'https://example.com',
          action_id: 'hello-1234',
        }
      end

      it { is_expected.to eq(expected_attributes) }
    end

    context 'with an accessibility_label' do
      let(:element) { described_class.new('Hello', url: 'https://example.com', accessibility_label: 'Hello world') }

      let(:expected_attributes) do
        {
          type: 'button',
          text: {
            type: 'plain_text',
            text: 'Hello',
            emoji: true,
          },
          url: 'https://example.com',
          accessibility_label: 'Hello world',
        }
      end

      it { is_expected.to eq(expected_attributes) }
    end
  end

  include_examples 'serializable element'
end
