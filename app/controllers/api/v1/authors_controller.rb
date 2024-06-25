module Api
  module V1
    class AuthorsController < ApplicationController
      def index
        request = V1::Authors::IndexRequest.new(
          per_page: params[:per_page].presence,
          page: params[:page].presence
        )
        handle_request(request)
      end
    end
  end
end
