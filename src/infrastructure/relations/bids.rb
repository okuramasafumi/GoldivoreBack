# frozen_string_literal: true

module Infrastructure
  module Relations
    class Bids < ROM::Relation[:sql]
      schema(:bids, infer: true) do
        associations do
          belongs_to :character
          belongs_to :instance
          belongs_to :item
        end
      end
    end
  end
end
