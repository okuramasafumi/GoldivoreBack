# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :bids do
      primary_key :id
      column :amount, Integer, null: false

      foreign_key :character_id, :characters, null: false
      foreign_key :instance_id, :instances, null: false
      foreign_key :item_id, :items, null: false

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
