# frozen_string_literal: true

module Infrastructure
  module Relations
    class Expansions < ROM::Relation[:sql]
      schema(:expansions, infer: true) do
        associations do
          has_many :raids
        end
      end
    end
  end
end
