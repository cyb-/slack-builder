# frozen_string_literal: true

require 'spec_helper'

RSpec.describe SlackBuilder::Elements::RichTextElements::Broadcast do
  subject(:element) { described_class.new(:broadcast_range) }

  describe '#to_h' do
    subject { element.to_h }

    let(:expected_attributes) do
      {
        type: 'broadcast',
        range: 'broadcast_range',
      }
    end

    it { is_expected.to eq(expected_attributes) }
  end

  include_examples 'serializable element'
end
