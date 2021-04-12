# frozen_string_literal: true

module Domain
  module Organization
    class Encounter < Dry::Struct
      attribute :id, Types::Integer

      attribute :name, Types::String
      attribute :image, Types::String | Types::Nil
      attribute :wow_id, Types::String | Types::Nil
      attribute :items, Types::Array.of(Item)
    end
  end
end
