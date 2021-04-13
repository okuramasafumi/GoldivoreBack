# frozen_string_literal: true

module Application
  module Controllers
    module Raids
      module Encounters
        class Index < Controller
          include Hanami::Action
          include Domain::Organization::Importer[encounters: 'encounter_repository']
          include Importer[serializer: 'serializers.encounters_serializer']

          def call(_params)
            encounters_for_raid = encounters.for_raid(params[:raid_id])

            respond_with(serializer.serialize(encounters_for_raid))
          end
        end
      end
    end
  end
end
