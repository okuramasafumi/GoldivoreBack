# frozen_string_literal: true

module Domain
  module Organization
    class EncounterRepository < ROM::Repository[:encounters]
      include Goldivore::Import['container']

      def for_raid(raid_id)
        encounters
          .where(encounters[:raid_id] => raid_id)
          .order(encounters[:rank])
          .combine(:items)
          .to_a
          .map { |row| row_to_instance(row) }
      end

      private

      def row_to_instance(row)
        Encounter.new(
          id: row.id,
          name: row.name,
          image: row.image,
          wow_id: row.wow_id,
          items: row.items.map { |item| row_item_to_instance(item) }
        )
      end

      def row_item_to_instance(row)
        Item.new(
          id: row.id,
          name: row.name,
          icon: row.icon,
          quality: row.quality,
          wow_id: row.wow_id
        )
      end
    end
  end
end
