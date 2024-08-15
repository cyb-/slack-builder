# frozen_string_literal: true

require 'spec_helper'

RSpec.describe SlackBuilder::Elements::RichTextElements::Usergroup do
  subject(:element) { described_class.new('ABC42') }

  describe '#to_h' do
    subject { element.to_h }

    let(:expected_attributes) do
      {
        type: 'usergroup',
        usergroup_id: 'ABC42',
      }
    end

    it { is_expected.to eq(expected_attributes) }

    context 'with some styles' do
      let(:element) { described_class.new('ABC42', bold: true, highlight: true) }

      let(:expected_attributes) do
        {
          type: 'usergroup',
          usergroup_id: 'ABC42',
          style: {
            bold: true,
            highlight: true,
          },
        }
      end

      it { is_expected.to eq(expected_attributes) }
    end

    context 'with all styles' do
      let(:element) { described_class.new('ABC42', bold: true, italic: true, strike: true, highlight: true, client_highlight: true, unlink: true) }

      let(:expected_attributes) do
        {
          type: 'usergroup',
          usergroup_id: 'ABC42',
          style: {
            bold: true,
            italic: true,
            strike: true,
            highlight: true,
            client_highlight: true,
            unlink: true,
          },
        }
      end

      it { is_expected.to eq(expected_attributes) }
    end
  end

  include_examples 'serializable element'
end
