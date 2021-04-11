# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :items do
      primary_key :id
      column :name, String, null: false, unique: true
      column :quality, String, null: false
      column :wow_id, String, null: false

      foreign_key :encounter_id, :encounters, null: false
    end
  end
end
