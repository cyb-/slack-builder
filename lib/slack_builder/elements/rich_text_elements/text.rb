# frozen_string_literal: true

require_relative '../base/text'
require_relative 'concerns/has_style'
require_relative 'concerns/has_text_style'

module SlackBuilder
  module Elements
    module RichTextElements
      class Text < Base::Text
        include Concerns::HasStyle
        include Concerns::HasTextStyle

        TYPE = 'text'

        def initialize(*args, code: false, **kwargs)
          super(*args, **kwargs)
          style.merge!(code: code)
        end
      end
    end
  end
end
