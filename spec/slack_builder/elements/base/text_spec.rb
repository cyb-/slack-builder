# frozen_string_literal: true

require 'spec_helper'

RSpec.describe SlackBuilder::Elements::Base::Text do
  subject(:element) { klass.new('Foo bar baz') }

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
        text: 'Foo bar baz',
      }
    end

    it { is_expected.to eq(expected_attributes) }
  end

  include_examples 'serializable element'
end
