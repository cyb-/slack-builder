# frozen_string_literal: true

require 'spec_helper'

RSpec.describe SlackBuilder::Elements::Image do
  subject(:element) { described_class.new('https://media.giphy.com/media/AcfTF7tyikWyroP0x7/giphy.gif', alt_text: 'Foo bar baz') }

  describe '#to_h' do
    subject { element.to_h }

    let(:expected_attributes) do
      {
        type: 'image',
        image_url: 'https://media.giphy.com/media/AcfTF7tyikWyroP0x7/giphy.gif',
        alt_text: 'Foo bar baz',
      }
    end

    it { is_expected.to eq(expected_attributes) }

    context 'with a title' do
      let(:element) { described_class.new('https://media.giphy.com/media/AcfTF7tyikWyroP0x7/giphy.gif', alt_text: 'Foo bar baz', title: 'Hello', emoji: false) }

      let(:expected_attributes) do
        {
          type: 'image',
          image_url: 'https://media.giphy.com/media/AcfTF7tyikWyroP0x7/giphy.gif',
          alt_text: 'Foo bar baz',
          title: {
            type: 'plain_text',
            text: 'Hello',
            emoji: false,
          },
        }
      end

      it { is_expected.to eq(expected_attributes) }
    end
  end

  include_examples 'serializable element'
end
