# frozen_string_literal: true

module Application
  module Controllers
    module Servers
      class Index < Controller
        include Hanami::Action
        include Goldivore::Import[servers: 'domain.organization.server_repository']
        include Goldivore::Import[serializer: 'application.serializers.regions_serializer']

        def call(_params)
          regions = servers.for_all_regions

          respond_with(serializer.serialize(regions))
        end
      end
    end
  end
end
