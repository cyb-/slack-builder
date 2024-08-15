# frozen_string_literal: true

require_relative '../base/element'

module SlackBuilder
  module Elements
    module RichTextElements
      class Date < Base::Element
        TYPE = 'date'

        def initialize(timestamp, format:, url: nil, fallback: nil, **kwargs)
          @timestamp = timestamp
          @format = format
          @url = url unless url.nil?
          @fallback = fallback unless fallback.nil?
          super(**kwargs)
        end

        def to_h
          super.merge(timestamp: @timestamp, format: @format).tap do |h|
            h[:url] = @url if defined?(@url)
            h[:fallback] = @fallback if defined?(@fallback)
          end
        end
      end
    end
  end
end
