# frozen_string_literal: true

require_relative 'boot'

require 'dry/system/container'
require 'dry/auto_inject'

require 'dry/monitor'

require 'pry'
require 'pry-byebug'

module Goldivore
  class Application < Dry::System::Container
    use :env, inferrer: -> { ENV.fetch('APP_ENV', :development).to_sym }
    use :logging
    use :notifications
    use :bootsnap

    setting :logger, Dry::Monitor::Logger.new(root.join('log/development.log'))

    configure do |config|
      config.root = File.expand_path('..', __dir__)

      config.component_dirs.add 'src' do |dir|
        dir.auto_register = true
        dir.add_to_load_path = true
      end

      # config.component_dirs.add 'src/application' do |dir|
      #   dir.auto_register = true
      #   dir.add_to_load_path = true
      # end
      #
      # config.component_dirs.add 'src/domain' do |dir|
      #   dir.auto_register = true
      #   dir.add_to_load_path = true
      #   dir.default_namespace = 'domain'
      # end
      #
      # config.component_dirs.add 'src/infrastructure' do |dir|
      #   dir.auto_register = true
      #   dir.add_to_load_path = true
      # end

      after(:configure) do
        Dry::Monitor.load_extensions(:rack)

        register(:rack_monitor, Dry::Monitor::Rack::Middleware.new(self[:notifications]))
        rack_logger = Dry::Monitor::Rack::Logger.new(self[:logger])
        rack_logger.attach(self[:rack_monitor])
      end
    end
  end

  Import = Dry::AutoInject(Application)

  def self.finalize_application!
    Application.finalize!
  end
end
