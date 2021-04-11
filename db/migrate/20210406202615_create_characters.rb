# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :characters do
      primary_key :id
      column :name, String, null: false

      foreign_key :server_id, :servers, null: false
    end
  end
end
