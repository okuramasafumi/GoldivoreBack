# frozen_string_literal: true

module Domain
  module Organization
    class Raid < Dry::Struct
      attribute :id, Types::Integer
      attribute :name, Types::String
    end
  end
end
