# frozen_string_literal: true

module Application
  module Controllers
    module Servers
      class Index < Controller
        include Hanami::Action
        include Domain::Organization::Importer[servers: 'server_repository']
        include Importer[serializer: 'serializers.regions_serializer']

        def call(_params)
          regions = servers.for_all_regions

          respond_with(serializer.serialize(regions))
        end
      end
    end
  end
end
