# frozen_string_literal: true

require_relative '../base/element'
require_relative 'concerns/has_highlight_style'
require_relative 'concerns/has_style'
require_relative 'concerns/has_text_style'

module SlackBuilder
  module Elements
    module RichTextElements
      class User < Base::Element
        include Concerns::HasStyle
        include Concerns::HasTextStyle
        include Concerns::HasHighlightStyle

        TYPE = 'user'

        def initialize(user_id, ...)
          @user_id = user_id
          super(...)
        end

        def to_h
          super.merge(user_id: @user_id)
        end
      end
    end
  end
end
