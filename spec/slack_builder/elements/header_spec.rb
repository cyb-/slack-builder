# frozen_string_literal: true

require 'spec_helper'

RSpec.describe SlackBuilder::Elements::Header do
  subject(:element) { described_class.new('Hello world') }

  describe '#to_h' do
    subject { element.to_h }

    let(:expected_attributes) do
      {
        type: 'header',
        text: {
          type: 'plain_text',
          text: 'Hello world',
          emoji: true,
        },
      }
    end

    it { is_expected.to eq(expected_attributes) }
  end

  include_examples 'serializable element'
end
