# frozen_string_literal: true

require 'spec_helper'

RSpec.describe SlackBuilder::Elements::Video do
  subject(:element) { described_class.new('https://www.youtube.com/watch?v=PdaAHMztNVE', thumbnail_url: 'https://media.giphy.com/media/cYNjbM2MvPzM8raKvh/giphy.gif', alt_text: 'Foo bar baz', title: 'Hello', emoji: false) }

  describe '#to_h' do
    subject { element.to_h }

    let(:expected_attributes) do
      {
        type: 'video',
        video_url: 'https://www.youtube.com/watch?v=PdaAHMztNVE',
        thumbnail_url: 'https://media.giphy.com/media/cYNjbM2MvPzM8raKvh/giphy.gif',
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

  include_examples 'serializable element'
end
