# frozen_string_literal: true

module Domain
  module Organization
    class Region < Dry::Struct
      attribute :name, ::Domain::Organization::Types::String
      attribute :servers, ::Domain::Organization::Types::Array.of(Server)
    end
  end
end
