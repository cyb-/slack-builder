# frozen_string_literal: true

module SlackBuilder
  module Elements
    module RichTextElements
      module Concerns
        module HasTextStyle
          def initialize(*args, bold: false, italic: false, strike: false, **kwargs)
            super(*args, **kwargs)
            style.merge!(bold: bold, italic: italic, strike: strike)
          end
        end
      end
    end
  end
end
