module Application
  module Serializers
    class InstanceSerializer
      include Goldivore::Import['application.serializers.raid_serializer']
      include Goldivore::Import['application.serializers.server_serializer']

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
