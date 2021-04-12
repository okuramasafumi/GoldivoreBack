# frozen_string_literal: true

module Application
  module Serializers
    class ItemsSerializer
      include Goldivore::Import['application.serializers.item_serializer']

      def serialize(items)
        items.map { |item| item_serializer.serialize(item) }
      end
    end
  end
end
