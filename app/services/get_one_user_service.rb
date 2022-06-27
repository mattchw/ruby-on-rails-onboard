class GetOneUserService < ApplicationService
    attr_reader :id
  
    def initialize(id)
        @id = id
    end
  
    def call
        return User.find(@id)
    end
end