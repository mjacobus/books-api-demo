module Api
  module V1
    module Authors
      class IndexRequestHandler
        attr_reader :current_user

        def initialize(current_user:)
          @current_user = current_user
        end

        def handle(request)
          authors = current_user.authors.limit(request.per_page).offset(request.page - 1)
          IndexResponse.new(authors:)
        end
      end
    end
  end
end
