# frozen_string_literal: true

require 'spec_helper'

RSpec.describe SlackBuilder::Elements::RichTextElements::Color do
  subject(:element) { described_class.new('#666') }

  describe '#to_h' do
    subject { element.to_h }

    let(:expected_attributes) do
      {
        type: 'color',
        value: '#666',
      }
    end

    it { is_expected.to eq(expected_attributes) }
  end

  include_examples 'serializable element'
end
