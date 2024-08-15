# frozen_string_literal: true

require 'spec_helper'

RSpec.describe SlackBuilder::Attachment do
  subject(:attachment) { described_class.new(&blocks) }

  include_context 'with all blocks'

  describe '#to_a' do
    subject { attachment.to_a }

    it { is_expected.to eq(expected_blocks) }
  end

  describe '#to_ary' do
    subject { attachment.to_ary }

    it { is_expected.to eq(attachment.to_a) }
  end

  describe '#to_h' do
    subject { attachment.to_h }

    let(:expected_payload) do
      {
        blocks: expected_blocks,
      }
    end

    it { is_expected.to eq(expected_payload) }
  end

  describe '#to_hash' do
    subject { attachment.to_hash }

    it { is_expected.to eq(attachment.to_h) }
  end

  describe '#as_json' do
    subject { attachment.as_json }

    it { is_expected.to eq(attachment.to_h) }
  end
end
