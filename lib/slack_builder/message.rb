# frozen_string_literal: true

require_relative 'attachment'
require_relative 'elements/actions'
require_relative 'elements/divider'
require_relative 'elements/header'
require_relative 'elements/image'
require_relative 'elements/context'
require_relative 'elements/rich_text'
require_relative 'elements/section'
require_relative 'elements/video'
require_relative 'elements/base/concerns/has_elements'

module SlackBuilder
  class Message
    include Elements::Base::Concerns::HasElements

    def initialize(text = nil, &blk)
      @text = text unless text.nil?
      @attachments = []
      super(&blk)
    end

    def to_h
      {}.tap do |h|
        h[:text] = @text if @text
        h[:blocks] = to_a if any?
        h[:attachments] = @attachments.map(&:to_h) if @attachments.any?
      end
    end

    def attachment(...)
      return unless block_given?

      Attachment.new(...).tap do |a|
        @attachments << a
      end
    end

    def actions(...)
      add Elements::Actions.new(...) if block_given?
    end

    def context(...)
      add Elements::Context.new(...) if block_given?
    end

    def divider(...)
      add Elements::Divider.new(...)
    end

    def header(...)
      add Elements::Header.new(...)
    end

    def image(...)
      add Elements::Image.new(...)
    end

    def rich_text(...)
      add Elements::RichText.new(...) if block_given?
    end

    def section(...)
      add Elements::Section.new(...)
    end

    def video(...)
      add Elements::Video.new(...)
    end
  end
end
