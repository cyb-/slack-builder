# frozen_string_literal: true

require 'spec_helper'

RSpec.describe SlackBuilder::Elements::TextElements::PlainText do
  subject(:element) { described_class.new('Foo bar baz') }

  describe '#to_h' do
    subject { element.to_h }

    let(:expected_attributes) do
      {
        type: 'plain_text',
        text: 'Foo bar baz',
        emoji: true,
      }
    end

    it { is_expected.to eq(expected_attributes) }

    context 'with emoji option' do
      let(:element) { described_class.new('Foo bar baz', emoji: false) }

      let(:expected_attributes) do
        {
          type: 'plain_text',
          text: 'Foo bar baz',
          emoji: false,
        }
      end

      it { is_expected.to eq(expected_attributes) }
    end
  end

  include_examples 'serializable element'
end
