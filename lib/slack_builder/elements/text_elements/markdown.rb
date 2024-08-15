# frozen_string_literal: true

require_relative '../base/text'

module SlackBuilder
  module Elements
    module TextElements
      class Markdown < Base::Text
        TYPE = 'mrkdwn'

        def initialize(*args, verbatim: false, **kwargs)
          @verbatim = verbatim
          super(*args, **kwargs)
        end

        def to_h
          super.merge(verbatim: @verbatim)
        end
      end
    end
  end
end
