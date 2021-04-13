# frozen_string_literal: true

module Application
  module Serializers
    class EncountersSerializer
      include Importer['serializers.encounter_serializer']

      def serialize(encounters)
        encounters.map { |encounter| encounter_serializer.serialize(encounter) }
      end
    end
  end
end
