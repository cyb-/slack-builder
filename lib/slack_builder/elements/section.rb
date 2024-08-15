# frozen_string_literal: true

require_relative 'base/element'
require_relative 'base/concerns/has_elements'
require_relative 'interactive_elements/button'
require_relative 'text_elements/markdown'
require_relative 'text_elements/plain_text'
require_relative 'image'

module SlackBuilder
  module Elements
    class Section < Base::Element
      include Base::Concerns::HasElements

      TYPE = 'section'
      ELEMENTS_KEY_NAME = :fields

      class Accessory
        private_class_method :new

        def self.build(&blk)
          new.instance_exec(&blk)
        end

        private

        def button(...)
          InteractiveElements::Button.new(...)
        end

        def image(...)
          Image.new(...)
        end
      end

      def initialize(text = nil, verbatim: false, **kwargs, &blk)
        @text = TextElements::Markdown.new(text, verbatim: verbatim) unless text.nil?
        super(**kwargs, &blk)
      end

      def to_h
        super.tap do |h|
          h.delete(ELEMENTS_KEY_NAME) if empty?
          h[:text] = @text.to_h if defined?(@text)
          h[:accessory] = @accessory.to_h if defined?(@accessory)
        end
      end

      def accessory(...)
        @accessory = Accessory.build(...) if block_given?
      end

      def mrkdwn(...)
        add TextElements::Markdown.new(...)
      end

      def plain_text(...)
        add TextElements::PlainText.new(...)
      end
    end
  end
end
