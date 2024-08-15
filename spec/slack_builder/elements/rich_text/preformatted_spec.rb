# frozen_string_literal: true

require 'spec_helper'

RSpec.describe SlackBuilder::Elements::RichText::Preformatted do
  subject(:element) { described_class.new(&blocks) }

  include_context 'with rich_text elements'

  describe '#to_h' do
    subject { element.to_h }

    let(:expected_payload) do
      {
        type: 'rich_text_preformatted',
        elements: expected_blocks,
      }
    end

    it { is_expected.to eq(expected_payload) }
  end

  include_examples 'collection element'
  include_examples 'serializable element'
end
