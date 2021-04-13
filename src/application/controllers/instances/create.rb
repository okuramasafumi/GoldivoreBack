# frozen_string_literal: true

module Application
  module Controllers
    module Instances
      class Create < Controller
        include Hanami::Action

        include Domain::Organization::Importer[instances: 'instance_repository']
        include Importer[serializer: 'serializers.instance_serializer']

        def call(params)
          instance = instances.create(params.to_h)
          instance_with_relations = instances.find(instance.id)
          respond_with(serializer.serialize(instance_with_relations))
        end
      end
    end
  end
end
