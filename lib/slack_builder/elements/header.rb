# frozen_string_literal: true

require_relative 'base/element'
require_relative 'text_elements/plain_text'

module SlackBuilder
  module Elements
    class Header < Base::Element
      TYPE = 'header'

      def initialize(text, emoji: true, **kwargs)
        @text = TextElements::PlainText.new(text, emoji: emoji)
        super(**kwargs)
      end

      def to_h
        super.merge(text: @text.to_h)
      end
    end
  end
end
