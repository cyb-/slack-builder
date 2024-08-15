# frozen_string_literal: true

require_relative 'base/element'
require_relative 'text_elements/plain_text'

module SlackBuilder
  module Elements
    class Image < Base::Element
      TYPE = 'image'

      def initialize(image_url, alt_text:, title: nil, emoji: true, **kwargs)
        @image_url = image_url
        @alt_text = alt_text
        @title = TextElements::PlainText.new(title, emoji: emoji) unless title.nil?
        super(**kwargs)
      end

      def to_h
        super.merge(image_url: @image_url, alt_text: @alt_text).tap do |h|
          h[:title] = @title.to_h if defined?(@title)
        end
      end
    end
  end
end
