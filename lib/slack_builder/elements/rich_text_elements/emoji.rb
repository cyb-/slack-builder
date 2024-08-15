# frozen_string_literal: true

require_relative '../base/element'

module SlackBuilder
  module Elements
    module RichTextElements
      class Emoji < Base::Element
        TYPE = 'emoji'

        def initialize(name, ...)
          @name = name&.to_s
          super(...)
        end

        def to_h
          super.merge(name: @name)
        end
      end
    end
  end
end
