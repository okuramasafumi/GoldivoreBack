# frozen_string_literal: true

module Domain
  module Organization
    class Item < Dry::Struct
      attribute :id, Types::Integer

      attribute :name, Types::String
      attribute :icon, Types::String
      attribute :quality, Types::String
      attribute :wow_id, Types::String
    end
  end
end
