# frozen_string_literal: true

require 'spec_helper'

RSpec.describe SlackBuilder::Elements::RichTextElements::Link do
  subject(:element) { described_class.new('Hello', url: 'https://example.com') }

  describe '#to_h' do
    subject { element.to_h }

    let(:expected_attributes) do
      {
        type: 'link',
        text: 'Hello',
        url: 'https://example.com',
        unsafe: false,
      }
    end

    it { is_expected.to eq(expected_attributes) }

    context 'with unsafe option' do
      let(:element) { described_class.new('Hello', url: 'https://example.com', unsafe: true) }

      let(:expected_attributes) do
        {
          type: 'link',
          text: 'Hello',
          url: 'https://example.com',
          unsafe: true,
        }
      end

      it { is_expected.to eq(expected_attributes) }
    end

    context 'with some styles' do
      let(:element) { described_class.new('Hello', url: 'https://example.com', bold: true, code: true) }

      let(:expected_attributes) do
        {
          type: 'link',
          text: 'Hello',
          url: 'https://example.com',
          unsafe: false,
          style: {
            bold: true,
            code: true,
          },
        }
      end

      it { is_expected.to eq(expected_attributes) }
    end

    context 'with all styles' do
      let(:element) { described_class.new('Hello', url: 'https://example.com', bold: true, italic: true, strike: true, code: true) }

      let(:expected_attributes) do
        {
          type: 'link',
          text: 'Hello',
          url: 'https://example.com',
          unsafe: false,
          style: {
            bold: true,
            italic: true,
            strike: true,
            code: true,
          },
        }
      end

      it { is_expected.to eq(expected_attributes) }
    end
  end

  include_examples 'serializable element'
end
