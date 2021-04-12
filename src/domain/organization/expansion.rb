# frozen_string_literal: true

module Domain
  module Organization
    class Expansion < Dry::Struct
      attribute :name, Types::String
      attribute :raids, Types::Array.of(Raid)
    end
  end
end
