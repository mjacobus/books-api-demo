module Api
  module V1
    module Authors
      class IndexRequestHandler
        attr_reader :current_user

        def initialize(current_user:)
          @current_user = current_user
        end

        def handle(request)
          authors = current_user.authors.limit(request.limit)
          IndexResponse.new(authors:)
        end
      end
    end
  end
end
