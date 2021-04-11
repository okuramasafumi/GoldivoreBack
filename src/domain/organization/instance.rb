# frozen_string_literal: true

module Domain
  module Organization
    class Instance < Dry::Struct
      attribute :id, Types::Integer
      attribute :date, Types::Time
      attribute :raid, Raid
      attribute :server, Server
    end
  end
end
