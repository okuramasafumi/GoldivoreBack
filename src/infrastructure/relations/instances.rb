# frozen_string_literal: true

module Infrastructure
  module Relations
    class Instances < ROM::Relation[:sql]
      schema(:instances, infer: true) do
        associations do
          belongs_to :server
          belongs_to :raid
        end
      end
    end
  end
end
