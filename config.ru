# frozen_string_literal: true

require_relative 'config/application'

Goldivore.finalize_application!

run Application::Web.builder
