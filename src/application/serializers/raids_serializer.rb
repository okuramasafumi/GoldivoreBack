# frozen_string_literal: true

module Application
  module Serializers
    class RaidsSerializer
      include Goldivore::Import['application.serializers.raid_serializer']

      def serialize(raids)
        raids.map do |raid|
          raid_serializer.serialize(raid)
        end
      end
    end
  end
end
