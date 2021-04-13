# frozen_string_literal: true

module Application
  module Serializers
    class EncounterSerializer
      include Importer['serializers.items_serializer']

      def serialize(encounter)
        {
          id: encounter.id,
          name: encounter.name,
          image: encounter.image,
          wow_id: encounter.wow_id,
          items: items_serializer.serialize(encounter.items)
        }
      end
    end
  end
end
