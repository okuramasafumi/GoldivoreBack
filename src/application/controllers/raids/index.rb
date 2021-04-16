# frozen_string_literal: true

module Application
  module Controllers
    module Raids
      class Index < Controller
        include Hanami::Action

        include Domain::Organization::Importer[raids: 'raid_repository']
        include Importer[serializer: 'expansions_serializer']

        def call(_params)
          raid_by_extension = raids.for_all_expansions

          respond_with(serializer.new(raid_by_extension).serialize)
        end
      end
    end
  end
end
