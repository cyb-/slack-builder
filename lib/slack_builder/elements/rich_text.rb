# frozen_string_literal: true

require_relative 'base/element'
require_relative 'base/concerns/has_elements'
require_relative 'rich_text_elements/broadcast'
require_relative 'rich_text_elements/channel'
require_relative 'rich_text_elements/color'
require_relative 'rich_text_elements/date'
require_relative 'rich_text_elements/emoji'
require_relative 'rich_text_elements/link'
require_relative 'rich_text_elements/text'
require_relative 'rich_text_elements/user'
require_relative 'rich_text_elements/usergroup'

module SlackBuilder
  module Elements
    class RichText < Base::Element
      include Base::Concerns::HasElements

      TYPE = 'rich_text'

      module HasBorder
        def initialize(border: nil, **kwargs, &blk)
          @border = border unless border.nil?
          super(**kwargs, &blk)
        end

        def to_h
          super.tap do |h|
            h[:border] = @border if defined?(@border)
          end
        end
      end

      class Section < Base::Element
        include Base::Concerns::HasElements

        TYPE = 'rich_text_section'

        def broadcast(...)
          add RichTextElements::Broadcast.new(...)
        end

        def channel(...)
          add RichTextElements::Channel.new(...)
        end

        def color(...)
          add RichTextElements::Color.new(...)
        end

        def date(...)
          add RichTextElements::Date.new(...)
        end

        def emoji(...)
          add RichTextElements::Emoji.new(...)
        end

        def link(...)
          add RichTextElements::Link.new(...)
        end

        def text(...)
          add RichTextElements::Text.new(...)
        end

        def user(...)
          add RichTextElements::User.new(...)
        end

        def usergroup(...)
          add RichTextElements::Usergroup.new(...)
        end
      end

      class Preformatted < Section
        include HasBorder

        TYPE = 'rich_text_preformatted'
      end

      class Quote < Section
        include HasBorder

        TYPE = 'rich_text_quote'
      end

      class List < Base::Element
        include Base::Concerns::HasElements
        include HasBorder

        TYPE = 'rich_text_list'

        def initialize(style, indent: nil, offset: nil, **kwargs, &blk)
          @style = style&.to_s
          @indent = indent unless indent.nil?
          @offset = offset unless offset.nil?
          super(**kwargs, &blk)
        end

        def to_h
          super.merge(style: @style).tap do |h|
            h[:indent] = @indent if defined?(@indent)
            h[:offset] = @offset if defined?(@offset)
          end
        end

        def section(...)
          add Section.new(...) if block_given?
        end
      end

      protected

      def section(...)
        add Section.new(...) if block_given?
      end

      def preformatted(...)
        add Preformatted.new(...) if block_given?
      end

      def quote(...)
        add Quote.new(...) if block_given?
      end

      def list(...)
        add List.new(...) if block_given?
      end
    end
  end
end
