# frozen_string_literal: true

module SlackBuilder
  module Elements
    module RichTextElements
      module Concerns
        module HasStyle
          def initialize(...)
            @style = {}
            super
          end

          def to_h
            filtered_style.then do |style|
              style.empty? ? super : super.merge(style: style)
            end
          end

          private

          attr_reader :style

          def filtered_style
            style.select { |_, v| v }
          end
        end
      end
    end
  end
end
