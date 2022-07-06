class Api::V1::WishListItemsController < ApplicationController
  def index
    @page = params.fetch('page', 1).to_i.abs
    @limit = params.fetch('limit', 10).to_i.abs
    @offset = (@page - 1) * @limit
    @user = User.find(params[:user_id]) if params[:user_id].present?

    @count = WishListItem.all.count
    @wish_list_items = WishListItem.all.includes(:product)
    @wish_list_items = @wish_list_items.skip(@offset).limit(@limit)

    # render json: {
    #   count: @count,
    #   items: @wish_list_items
    # }, status: 200
  end

  def create
    begin
      @user = User.find(wish_list_item_params[:user_id])
      @product = Product.find(wish_list_item_params[:product_id])
      @wish_list_item = WishListItem.create!(**wish_list_item_params, user: @user, product: @product)
      render json: @wish_list_item, status: 200
    rescue => exception
      render error: {
        error: 'Unable to create new wish_list_item'
      }, status: 400
    end
  end

  private
    def wish_list_item_params
      params.require(:wish_list_item).permit(
        :user_id,
        :product_id,
      )
    end
end