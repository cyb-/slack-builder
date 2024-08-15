# frozen_string_literal: true

require 'spec_helper'

RSpec.describe SlackBuilder::Elements::TextElements::Markdown do
  subject(:element) { described_class.new('Foo bar baz') }

  describe '#to_h' do
    subject { element.to_h }

    let(:expected_attributes) do
      {
        type: 'mrkdwn',
        text: 'Foo bar baz',
        verbatim: false,
      }
    end

    it { is_expected.to eq(expected_attributes) }

    context 'with verbatim option' do
      let(:element) { described_class.new('Foo bar baz', verbatim: true) }

      let(:expected_attributes) do
        {
          type: 'mrkdwn',
          text: 'Foo bar baz',
          verbatim: true,
        }
      end

      it { is_expected.to eq(expected_attributes) }
    end
  end

  include_examples 'serializable element'
end
