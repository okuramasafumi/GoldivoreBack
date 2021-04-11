module Application
  module Serializers
    class ServerSerializer
      def serialize(server)
        { name: server.name, id: server.id }
      end
    end
  end
end
