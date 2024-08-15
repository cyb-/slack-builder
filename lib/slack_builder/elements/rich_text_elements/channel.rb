# frozen_string_literal: true

require_relative '../base/element'
require_relative 'concerns/has_highlight_style'
require_relative 'concerns/has_style'
require_relative 'concerns/has_text_style'

module SlackBuilder
  module Elements
    module RichTextElements
      class Channel < Base::Element
        include Concerns::HasStyle
        include Concerns::HasTextStyle
        include Concerns::HasHighlightStyle

        TYPE = 'channel'

        def initialize(channel_id, ...)
          @channel_id = channel_id
          super(...)
        end

        def to_h
          super.merge(channel_id: @channel_id)
        end
      end
    end
  end
end
