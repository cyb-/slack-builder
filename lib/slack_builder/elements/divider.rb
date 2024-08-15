# frozen_string_literal: true

require_relative 'base/element'

module SlackBuilder
  module Elements
    class Divider < Base::Element
      TYPE = 'divider'
    end
  end
end
