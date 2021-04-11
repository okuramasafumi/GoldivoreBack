# frozen_string_literal: true

module Application
  module Controllers
    module Raids
      class Index < Controller
        include Hanami::Action
        include Goldivore::Import[raids: 'domain.organization.raid_repository']
        include Goldivore::Import[serializer: 'application.serializers.expansions_serializer']

        def call(_params)
          raid_by_extension = raids.for_all_expansions

          respond_with(serializer.serialize(raid_by_extension))
        end
      end
    end
  end
end
