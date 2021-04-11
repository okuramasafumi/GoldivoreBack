# frozen_string_literal: true

module Application
  module Controllers
    class Controller
      def respond_with(object, code: 200, format: :json)
        self.format = format
        self.body = object.to_json
        self.status = code
        self
      end
    end
  end
end
