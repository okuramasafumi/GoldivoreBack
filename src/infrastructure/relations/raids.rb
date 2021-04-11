# frozen_string_literal: true

module Infrastructure
  module Relations
    class Raids < ROM::Relation[:sql]
      schema(:raids, infer: true) do
        associations do
          belongs_to :expansion
          has_many :encounters
          has_many :instances
        end
      end
    end
  end
end
