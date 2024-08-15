# frozen_string_literal: true

require_relative 'text'

module SlackBuilder
  module Elements
    module RichTextElements
      class Link < Text
        TYPE = 'link'

        def initialize(*args, url:, unsafe: false, **kwargs)
          @url = url
          @unsafe = unsafe
          super(*args, **kwargs)
        end

        def to_h
          super.merge(url: @url, unsafe: @unsafe)
        end
      end
    end
  end
end
