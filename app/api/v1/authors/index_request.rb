module Api 
  module V1
    module Authors
      class IndexRequest
        attr_reader :limit

        def initialize(limit:)
          @limit = limit
        end
      end
    end
  end
end
