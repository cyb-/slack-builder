# frozen_string_literal: true

require_relative '../base/element'

module SlackBuilder
  module Elements
    module RichTextElements
      class Color < Base::Element
        TYPE = 'color'

        def initialize(value, ...)
          @value = value&.to_s
          super(...)
        end

        def to_h
          super.merge(value: @value)
        end
      end
    end
  end
end
