# frozen_string_literal: true

module Infrastructure
  module Relations
    class Items < ROM::Relation[:sql]
      schema(:items, infer: true) do
        associations do
          has_many :bids
          belongs_to :encounter
        end
      end
    end
  end
end
