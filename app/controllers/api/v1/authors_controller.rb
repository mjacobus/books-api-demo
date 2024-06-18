module Api
  module V1
    class AuthorsController < ApplicationController
      def index
        request = V1::Authors::IndexRequest.new(limit: 2)
        handle_request(request)
      end
    end
  end
end
