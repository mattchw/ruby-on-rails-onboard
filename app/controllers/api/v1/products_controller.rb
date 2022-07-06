class Api::V1::ProductsController < ApplicationController
  def index
    @skip = params.fetch(:skip, 0).to_i
    @limit = params.fetch(:limit, 10).to_i

    @count = Product.all.count
    @products = Product.all

    render json: {
      count: @count,
      items: @products
    }, status: 200
  end

  def create
    begin
      # user has one product; product belongs to user
      @user = User.find(product_params[:user_id])
      @product = Product.create!(**product_params, user: @user)
      render json: @product, status: 200
    rescue => exception
      render error: {
        error: 'Unable to create new product'
      }, status: 400
    end
  end

  private
    def product_params
      params.require(:product).permit(:name,:description,:price,:user_id)
    end
end