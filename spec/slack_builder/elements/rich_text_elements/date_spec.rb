# frozen_string_literal: true

require 'spec_helper'

RSpec.describe SlackBuilder::Elements::RichTextElements::Date do
  subject(:element) { described_class.new(42, format: '{foo}') }

  describe '#to_h' do
    subject { element.to_h }

    let(:expected_attributes) do
      {
        type: 'date',
        timestamp: 42,
        format: '{foo}',
      }
    end

    it { is_expected.to eq(expected_attributes) }

    context 'with url option' do
      let(:element) { described_class.new(42, format: '{foo}', url: 'https://example.com') }

      let(:expected_attributes) do
        {
          type: 'date',
          timestamp: 42,
          format: '{foo}',
          url: 'https://example.com',
        }
      end

      it { is_expected.to eq(expected_attributes) }
    end

    context 'with fallback option' do
      let(:element) { described_class.new(42, format: '{foo}', fallback: 'bar') }

      let(:expected_attributes) do
        {
          type: 'date',
          timestamp: 42,
          format: '{foo}',
          fallback: 'bar',
        }
      end

      it { is_expected.to eq(expected_attributes) }
    end
  end

  include_examples 'serializable element'
end
