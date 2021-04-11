# frozen_string_literal: true

module Infrastructure
  module Relations
    class Encounters < ROM::Relation[:sql]
      schema(:encounters, infer: true) do
        associations do
          has_many :items
          belongs_to :raid
        end
      end
    end
  end
end
