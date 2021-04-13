# frozen_string_literal: true

require_relative 'lib/injector_namespaced'

module Importers
  Application = InjectorNamespaced.new(Goldivore::Import, 'application.')
  Infrastructure = InjectorNamespaced.new(Goldivore::Import, 'infrastructure.')

  module Domain
    Organization = InjectorNamespaced.new(Goldivore::Import, 'domain.organization.')
  end
end
