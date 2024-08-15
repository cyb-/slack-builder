# frozen_string_literal: true

RSpec.shared_examples 'serializable element' do
  describe '#to_hash' do
    subject { element.to_hash }

    it { is_expected.to eq(element.to_h) }
  end

  describe '#as_json' do
    subject { element.as_json }

    it { is_expected.to eq(element.to_h) }
  end
end
