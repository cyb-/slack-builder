# frozen_string_literal: true

require_relative 'base/element'
require_relative 'text_elements/plain_text'

module SlackBuilder
  module Elements
    class Video < Base::Element
      TYPE = 'video'

      def initialize(video_url, thumbnail_url:, alt_text:, title:, emoji: true, **kwargs)
        @video_url = video_url
        @thumbnail_url = thumbnail_url
        @alt_text = alt_text
        @title = TextElements::PlainText.new(title, emoji: emoji)
        super(**kwargs)
      end

      def to_h
        super.merge(
          video_url: @video_url,
          thumbnail_url: @thumbnail_url,
          alt_text: @alt_text,
          title: @title.to_h
        )
      end
    end
  end
end
