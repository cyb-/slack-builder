# frozen_string_literal: true

require_relative '../base/element'
require_relative '../text_elements/plain_text'

module SlackBuilder
  module Elements
    module InteractiveElements
      class Button < Base::Element
        TYPE = 'button'

        def initialize(text, url:, style: nil, emoji: true, action_id: nil, accessibility_label: nil, **kwargs)
          @text = TextElements::PlainText.new(text, emoji: emoji)
          @url = url
          @style = style.to_s unless style.nil?
          @action_id = action_id unless action_id.nil?
          @accessibility_label = accessibility_label unless accessibility_label.nil?
          super(**kwargs)
        end

        def to_h
          super.merge(text: @text.to_h, url: @url).tap do |h|
            h[:style] = @style if defined?(@style)
            h[:action_id] = @action_id if defined?(@action_id)
            h[:accessibility_label] = @accessibility_label if defined?(@accessibility_label)
          end
        end
      end
    end
  end
end
