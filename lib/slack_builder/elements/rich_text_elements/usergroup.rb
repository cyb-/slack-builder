# frozen_string_literal: true

require_relative '../base/element'
require_relative 'concerns/has_highlight_style'
require_relative 'concerns/has_style'
require_relative 'concerns/has_text_style'

module SlackBuilder
  module Elements
    module RichTextElements
      class Usergroup < Base::Element
        include Concerns::HasStyle
        include Concerns::HasTextStyle
        include Concerns::HasHighlightStyle

        TYPE = 'usergroup'

        def initialize(usergroup_id, ...)
          @usergroup_id = usergroup_id
          super(...)
        end

        def to_h
          super.merge(usergroup_id: @usergroup_id)
        end
      end
    end
  end
end
