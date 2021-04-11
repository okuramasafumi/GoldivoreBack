# frozen_string_literal: true

module Domain
  module Organization
    class ServerRepository < ROM::Repository[:servers]
      include Goldivore::Import['container']

      def for_all_regions
        servers
          .order { [region, name] }
          .to_a
          .chunk(&:region)
          .to_a
          .map { |name, servers| Region.new(name: name, servers: servers_struct(servers)) }
      end

      private

      def servers_struct(servers)
        servers.map { |server| Server.new(name: server.name, id: server.id) }
      end
    end
  end
end
