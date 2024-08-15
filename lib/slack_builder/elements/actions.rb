# frozen_string_literal: true

require_relative 'base/element'
require_relative 'base/concerns/has_elements'
require_relative 'interactive_elements/button'

module SlackBuilder
  module Elements
    class Actions < Base::Element
      include Base::Concerns::HasElements

      TYPE = 'actions'

      def button(...)
        add InteractiveElements::Button.new(...)
      end
    end
  end
end
