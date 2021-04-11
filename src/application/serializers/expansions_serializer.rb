module Application
  module Serializers
    class ExpansionsSerializer
      include Goldivore::Import['application.serializers.raids_serializer']

      def serialize(expansions)
        expansions.each_with_object({}) do |expansion, acc|
          acc[expansion.name] = raids_serializer.serialize(expansion.raids)
        end
      end
    end
  end
end
