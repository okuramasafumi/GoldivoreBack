# frozen_string_literal: true

module Infrastructure
  module Relations
    class Characters < ROM::Relation[:sql]
      schema(:characters, infer: true) do
        associations do
          belongs_to :server
          has_many :bids
        end
      end
    end
  end
end
