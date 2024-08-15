# frozen_string_literal: true

require 'spec_helper'

RSpec.describe SlackBuilder::Elements::Base::Element do
  subject(:element) { klass.new }

  let(:klass) do
    Class.new(described_class) do
      const_set('TYPE', 'hello')
    end
  end

  describe '#to_h' do
    subject { element.to_h }

    let(:expected_attributes) do
      {
        type: 'hello',
      }
    end

    it { is_expected.to eq(expected_attributes) }

    context 'with a block_id' do
      let(:element) { klass.new(block_id: 'world') }

      let(:expected_attributes) do
        {
          type: 'hello',
          block_id: 'world',
        }
      end

      it { is_expected.to eq(expected_attributes) }
    end
  end

  include_examples 'serializable element'
end
