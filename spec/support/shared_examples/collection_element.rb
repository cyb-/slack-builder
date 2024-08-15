# frozen_string_literal: true

RSpec.shared_examples 'collection element' do
  describe '#to_a' do
    subject { element.to_a }

    it { is_expected.to eq(expected_blocks) }
  end

  describe '#to_ary' do
    subject { element.to_ary }

    it { is_expected.to eq(element.to_a) }
  end
end
