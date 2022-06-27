class Api::V1::ShopsController < ApplicationController

    # GET /shops
    def index
      @offset = params.fetch(:offset, 0).to_i
      @limit = params.fetch(:limit, 24).to_i
  
      @count = Shop.all.count
      @shops = Shop.all
    end
  
    # GET /shops/count
    def count
      @count = Shop.all.count
      render json: @count, status: 200
    end

    # GET /users/:id/shops
    def show_shops
      @user = User.find(params[:id])
      @shop = @user.shop
      render json: @shop, status: 200
    end

    # POST /users/:id/shops
    def create
      begin
        # user has one shop; shop belongs to user
        @user = User.find(params[:id])
        @shop = Shop.create!(**shop_params, user: @user)
        render json: @shop, status: 200
      rescue => exception
        render error: {
          error: 'Unable to create new Shop'
        }, status: 400
      end
    end
  
    # GET /shops/:id
    def show
      @shop = Shop.find(params[:id])
      render json: @shop, status: 200
    end
  
    # PATCH /shops/:id
    def update
      begin
        @shop = Shop.find(params[:id])
        if @shop
          @shop.update(shop_params)
          
        end
        render json: {
          message: 'Shop updated successfully'
        }, status: 200
      rescue => exception
        render error: {
          error: 'Unable to update Shop'
        }, status: 400
      end
    end
  
    # DELETE /shops/:id
    def delete
      begin
        @shop = Shop.find(params[:id])
        if @shop
          @shop.destroy
        end
        render json: {
          message: 'Shop deleted successfully'
        }, status: 200
      rescue => exception
        render jso: {
          error: 'Unable to delete Shop'
        }, status: 400
      end
    end
  
    private
    def shop_params
      params.require(:shop).permit(:name,:description)
    end
  end
  