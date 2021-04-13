# frozen_string_literal: true

module Application
  module Controllers
    module Instances
      class Index < Controller
        include Hanami::Action
        include Domain::Organization::Importer[raids: 'raid_repository']
        include Importer[serializer: 'serializers.expansions_serializer']

        def call(_params)
          raid_by_extension = raids.for_all_expansions

          respond_with(serializer.serialize(raid_by_extension))
        end
      end
    end
  end
end
