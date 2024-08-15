# frozen_string_literal: true

require_relative 'base/element'
require_relative 'base/concerns/has_elements'
require_relative 'text_elements/markdown'
require_relative 'text_elements/plain_text'
require_relative 'image'

module SlackBuilder
  module Elements
    class Context < Base::Element
      include Base::Concerns::HasElements

      TYPE = 'context'

      def image(...)
        add Image.new(...)
      end

      def mrkdwn(...)
        add TextElements::Markdown.new(...)
      end

      def plain_text(...)
        add TextElements::PlainText.new(...)
      end
    end
  end
end
