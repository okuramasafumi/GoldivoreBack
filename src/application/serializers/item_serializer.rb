# frozen_string_literal: true

module Application
  module Serializers
    class ItemSerializer
      def serialize(item)
        {
          id: item.id,
          name: item.name,
          icon: item.icon,
          quality: item.quality,
          wow_id: item.wow_id
        }
      end
    end
  end
end
