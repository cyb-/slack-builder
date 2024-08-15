# frozen_string_literal: true

require_relative '../base/element'

module SlackBuilder
  module Elements
    module RichTextElements
      class Broadcast < Base::Element
        TYPE = 'broadcast'

        def initialize(range, ...)
          @range = range&.to_s
          super(...)
        end

        def to_h
          super.merge(range: @range)
        end
      end
    end
  end
end
