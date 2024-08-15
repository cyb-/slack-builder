# frozen_string_literal: true

require_relative 'element'

module SlackBuilder
  module Elements
    module Base
      class Text < Element
        def initialize(text, ...)
          @text = text
          super(...)
        end

        def to_h
          super.merge(text: @text)
        end
      end
    end
  end
end
