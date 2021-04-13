# frozen_string_literal: true

module Application
  module Serializers
    class InstanceSerializer
      include Importer['serializers.raid_serializer']
      include Importer['serializers.server_serializer']

      def serialize(instance)
        {
          id: instance.id,
          date: instance.date,
          server: server_serializer.serialize(instance.server),
          raid: raid_serializer.serialize(instance.raid)
        }
      end
    end
  end
end
