class CreateUserService < ApplicationService
    attr_reader :user_params
  
    def initialize(params)
        @user_params = params
    end
  
    def call
        user = User.create(user_params)
    end
end