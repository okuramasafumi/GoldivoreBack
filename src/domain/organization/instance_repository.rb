# frozen_string_literal: true

module Domain
  module Organization
    class InstanceRepository < ROM::Repository[:instances]
      include Goldivore::Import['container']

      commands :create,
               use: :timestamps,
               plugins_options: {
                 timestamps: {
                   timestamps: %i[created_at updated_at]
                 }
               }

      def for_server(server_id)
        instances
          .where(server_id: server_id)
          .join(:raid)
          .join(:server)
          .select_append(raids[:name].as(:raid_name), servers[:name].as(:server_name))
          .map { |row| row_to_instance(row) }
      end

      def find(id)
        instances
          .where(instances[:id] => id)
          .join(:raid)
          .join(:server)
          .select_append(raids[:name].as(:raid_name), servers[:name].as(:server_name))
          .one
          .then { |row| row_to_instance(row) }
      end

      private

      def row_to_instance(row)
        Instance.new(
          id: row.id,
          date: row.date,
          raid: Raid.new(id: row.raid_id, name: row.raid_name),
          server: Server.new(id: row.server_id, name: row.server_name)
        )
      end
    end
  end
end
