module Api
  module V1
    module Authors
      class IndexResponse
        attr_reader :data, :status, :headers

        def initialize(authors:, status: 200, headers: {})
          @authors = authors
          @status = status
          @headers = headers
        end

        def data
          { data: @authors }
        end
      end
    end
  end
end
