# frozen_string_literal: true

module Infrastructure
  module Relations
    class Servers < ROM::Relation[:sql]
      schema(:servers, infer: true) do
        associations do
          has_many :characters
          has_many :instances
        end
      end
    end
  end
end
