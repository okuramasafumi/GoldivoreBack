# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :raids do
      primary_key :id
      column :name, String, null: false

      foreign_key :expansion_id, :expansions, null: false
    end
  end
end
