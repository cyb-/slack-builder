# frozen_string_literal: true

module SlackBuilder
  module Elements
    module RichTextElements
      module Concerns
        module HasHighlightStyle
          def initialize(*args, highlight: false, client_highlight: false, unlink: false, **kwargs)
            super(*args, **kwargs)
            style.merge!(highlight: highlight, client_highlight: client_highlight, unlink: unlink)
          end
        end
      end
    end
  end
end
