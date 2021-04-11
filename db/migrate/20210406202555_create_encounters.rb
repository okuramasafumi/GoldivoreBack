# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :encounters do
      primary_key :id
      column :name, String, null: false, unique: true
      column :image, String, null: true
      column :wow_id, String, null: true

      column :rank, Integer, null: false

      foreign_key :raid_id, :raids, null: false
    end
  end
end
