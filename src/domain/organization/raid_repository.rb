# frozen_string_literal: true

module Domain
  module Organization
    class RaidRepository < ROM::Repository[:raids]
      include Goldivore::Import['container']

      def for_all_expansions
        rel_expansion = expansions
        raids
          .join(:expansion)
          .select_append { rel_expansion[:name].as(:extension_name) }
          .order { [rel_expansion[:rank].asc] }
          .to_a
          .chunk(&:extension_name)
          .map { |extension_name, raids| Expansion.new(name: extension_name, raids: raids_struct(raids)) }
      end

      private

      def raids_struct(raids)
        raids.map { |raid| Raid.new(name: raid.name, id: raid.id) }
      end
    end
  end
end
