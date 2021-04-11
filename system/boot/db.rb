# frozen_string_literal: true

Goldivore::Application.boot(:db) do
  init do
    require 'rom'
    require 'rom-sql'
    require 'rom/sql/extensions/postgres'

    connection = Sequel.connect(ENV['DATABASE_URL'], extensions: %i[pg_timestamptz])

    rom = ROM::Configuration.new(:sql, connection) do |config|
      config.gateways[:default].use_logger(Goldivore::Application.logger)
    end

    register('db.connection', connection)
    register('db.config', rom)
  end
end
