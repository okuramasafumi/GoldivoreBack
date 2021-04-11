# frozen_string_literal: true

module Application
  module Contracts
    class InstanceCreate < Dry::Validation::Contract
      params do
        required(:raid_id).filled(:integer)
        required(:server_id).filled(:integer)
        required(:date).filled(:date_time)
      end
    end
  end
end
