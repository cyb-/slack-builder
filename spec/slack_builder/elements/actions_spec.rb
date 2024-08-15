# frozen_string_literal: true

require 'spec_helper'

RSpec.describe SlackBuilder::Elements::Actions do
  subject(:element) { described_class.new(&blocks) }

  include_context 'with interactive blocks'

  describe '#to_h' do
    subject { element.to_h }

    let(:expected_attributes) do
      {
        type: 'actions',
        elements: expected_blocks,
      }
    end

    it { is_expected.to eq(expected_attributes) }
  end

  include_examples 'collection element'
  include_examples 'serializable element'
end
