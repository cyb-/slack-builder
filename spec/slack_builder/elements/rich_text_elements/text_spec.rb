# frozen_string_literal: true

require 'spec_helper'

RSpec.describe SlackBuilder::Elements::RichTextElements::Text do
  subject(:element) { described_class.new('Hello') }

  describe '#to_h' do
    subject { element.to_h }

    let(:expected_attributes) do
      {
        type: 'text',
        text: 'Hello',
      }
    end

    it { is_expected.to eq(expected_attributes) }

    context 'with some styles' do
      let(:element) { described_class.new('Hello', bold: true, code: true) }

      let(:expected_attributes) do
        {
          type: 'text',
          text: 'Hello',
          style: {
            bold: true,
            code: true,
          },
        }
      end

      it { is_expected.to eq(expected_attributes) }
    end

    context 'with all styles' do
      let(:element) { described_class.new('Hello', bold: true, italic: true, strike: true, code: true) }

      let(:expected_attributes) do
        {
          type: 'text',
          text: 'Hello',
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
