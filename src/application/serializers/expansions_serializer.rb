# frozen_string_literal: true

require 'alba'

module Application
  module Serializers
    class ExpansionsSerializer
      include Alba::Resource

      many :raids do
        attributes :name, :id
      end
    end
  end
end
