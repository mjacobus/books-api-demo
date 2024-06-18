module Api
  module V1
    class AuthorsController < ApplicationController
      def index
        render json: {
          data: current_user.authors
        }
      end
    end
  end
end
