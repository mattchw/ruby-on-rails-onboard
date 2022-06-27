class GetUserService < ApplicationService
    attr_reader :limit, :skip
  
    def initialize(limit = 10, skip = 0)
        @limit = limit
        @skip = skip
    end
  
    def call
        count = User.all.count
        users = User.all.skip(@skip).limit(@limit)

        return {
            count: count,
            rows: users
        }
    end
end