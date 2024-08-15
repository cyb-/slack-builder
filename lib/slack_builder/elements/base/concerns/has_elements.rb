# frozen_string_literal: true

require_relative '../element'

module SlackBuilder
  module Elements
    module Base
      module Concerns
        module HasElements
          ELEMENTS_KEY_NAME = :elements

          def initialize(*args, **kwargs, &blk)
            @elements = []
            super(*args, **kwargs)
            append(&blk)
          end

          def to_a
            @elements.map(&:to_h)
          end

          def to_ary
            to_a
          end

          def empty?
            @elements.empty?
          end

          def any?
            !empty?
          end

          def to_h
            super.merge(self.class::ELEMENTS_KEY_NAME => to_a)
          end

          def to_hash
            to_h
          end

          def as_json(*)
            to_h
          end

          def append(&blk)
            instance_exec(&blk) if block_given?
          end

          private

          def add(element)
            raise ArgumentError, 'Invalid element' unless element.is_a?(Element)

            @elements << element
            element
          end
        end
      end
    end
  end
end
