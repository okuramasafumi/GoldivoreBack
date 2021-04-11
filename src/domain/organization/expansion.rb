# frozen_string_literal: true

module Domain
  module Organization
    class Expansion < Dry::Struct
      attribute :name, ::Domain::Organization::Types::String
      attribute :raids, ::Domain::Organization::Types::Array.of(Raid)
    end
  end
end
