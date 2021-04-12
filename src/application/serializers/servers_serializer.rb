# frozen_string_literal: true

module Application
  module Serializers
    class ServersSerializer
      include Goldivore::Import['application.serializers.server_serializer']

      def serialize(servers)
        servers.map do |server|
          server_serializer.serialize(server)
        end
      end
    end
  end
end
