# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :instances do
      primary_key :id
      column :date, DateTime, null: false

      foreign_key :raid_id, :raids, null: false
      foreign_key :server_id, :servers, null: false

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
