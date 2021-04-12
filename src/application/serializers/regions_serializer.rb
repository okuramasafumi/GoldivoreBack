# frozen_string_literal: true

module Application
  module Serializers
    class RegionsSerializer
      include Goldivore::Import['application.serializers.servers_serializer']

      def serialize(regions)
        regions.each_with_object({}) do |region, acc|
          acc[region.name] = servers_serializer.serialize(region.servers)
        end
      end
    end
  end
end
