# frozen_string_literal: true

module Application
  module Serializers
    class RaidSerializer
      def serialize(raid)
        { name: raid.name, id: raid.id }
      end
    end
  end
end
