# frozen_string_literal: true

require_relative 'elements/base/concerns/has_elements'
require_relative 'elements/actions'
require_relative 'elements/divider'
require_relative 'elements/header'
require_relative 'elements/image'
require_relative 'elements/context'
require_relative 'elements/rich_text'
require_relative 'elements/section'
require_relative 'elements/video'

module SlackBuilder
  class Attachment
    include Elements::Base::Concerns::HasElements

    def initialize(color: nil, &blk)
      @color = color.to_s unless color.nil?
      super(&blk)
    end

    def to_h
      { blocks: to_a }.tap do |h|
        h[:color] = @color if defined?(@color)
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
