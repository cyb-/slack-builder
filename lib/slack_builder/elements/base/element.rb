# frozen_string_literal: true

module SlackBuilder
  module Elements
    module Base
      class Element
        attr_reader :block_id

        def initialize(block_id: nil)
          @block_id = block_id unless block_id.nil?
        end

        def type
          self.class::TYPE
        end

        def to_h
          { type: type, block_id: block_id }.compact
        end

        def to_hash
          to_h
        end

        def as_json(*)
          to_h
        end
      end
    end
  end
end
