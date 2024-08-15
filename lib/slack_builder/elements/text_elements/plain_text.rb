# frozen_string_literal: true

require_relative '../base/text'

module SlackBuilder
  module Elements
    module TextElements
      class PlainText < Base::Text
        TYPE = 'plain_text'

        def initialize(*args, emoji: true, **kwargs)
          @emoji = emoji
          super(*args, **kwargs)
        end

        def to_h
          super.merge(emoji: @emoji)
        end
      end
    end
  end
end
