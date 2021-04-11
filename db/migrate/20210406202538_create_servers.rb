# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :servers do
      primary_key :id
      column :name, String, null: false, unique: true
      column :region, String, null: false
    end
  end
end
