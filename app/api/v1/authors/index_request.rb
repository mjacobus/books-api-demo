module Api
  module V1
    module Authors
      class IndexRequest
        MAX_PER_PAGE = 100
        attr_reader :page, :per_page

        def initialize(per_page: nil, page: nil)
          @per_page = per_page.to_i
          @page = page.to_i

          @page = 1 unless @page.positive?

          @per_page = MAX_PER_PAGE if @per_page > MAX_PER_PAGE

          return if @per_page.positive?

          @per_page = MAX_PER_PAGE
        end
      end
    end
  end
end
