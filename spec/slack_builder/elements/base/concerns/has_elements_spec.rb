# frozen_string_literal: true

require 'spec_helper'

RSpec.describe SlackBuilder::Elements::Base::Concerns::HasElements do
  subject(:element) do
    klass.new do
      test 'Foo'
    end
  end

  let(:klass) do
    Class.new(SlackBuilder::Elements::Base::Element) do
      include SlackBuilder::Elements::Base::Concerns::HasElements
      const_set('TYPE', 'hello')

      const_set('TestElement', Class.new(SlackBuilder::Elements::Base::Text) do
        const_set('TYPE', 'world')
      end)

      def test(...)
        add self.class::TestElement.new(...)
      end
    end
  end

  let(:expected_blocks) do
    [
      {
        type: 'world',
        text: 'Foo',
      },
    ]
  end

  describe '#to_h' do
    subject { element.to_h }

    let(:expected_attributes) do
      {
        type: 'hello',
        elements: expected_blocks,
      }
    end

    it { is_expected.to eq(expected_attributes) }
  end

  include_examples 'serializable element'

  describe '#to_a' do
    subject { element.to_a }

    it { is_expected.to eq(expected_blocks) }
  end

  describe '#to_ary' do
    subject { element.to_ary }

    it { is_expected.to eq(element.to_a) }
  end

  describe '#append' do
    let(:blocks) do
      proc do
        test 'Bar'
      end
    end

    let(:new_blocks) do
      [
        {
          type: 'world',
          text: 'Bar',
        },
      ]
    end

    it 'appends the elements', :aggregate_failures do
      expect(element.to_a).to eq(expected_blocks)
      element.append(&blocks)
      expect(element.to_a).to eq(expected_blocks + new_blocks)
    end
  end
end
