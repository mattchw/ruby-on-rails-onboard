class Api::V1::UsersController < ApplicationController

  # GET /users
  def index
    @skip = params.fetch(:skip, 0).to_i
    @limit = params.fetch(:limit, 10).to_i

    @res = GetUserService.call(@limit, @skip)
  end

  # GET /users/count
  def count
    @res = GetUserService.call()
    render json: @res[:count], status: 200
  end

  # GET /users/:id
  def show
    @user = GetOneUserService.call(params[:id])
    render json: @user, status: 200
  end

  # GET /users/:id/name
  def show_fullname
    @user = User.find(params[:id])
    fullname = "#{@user[:first_name]} #{@user[:last_name]}"
    render json: fullname, status: 200
  end

  # POST /users
  def create
    @user = CreateUserService.call(user_params)
    render json: @user, status: 201
  end

  # PATCH /users/:id
  def update
    @user = User.find(params[:id])
    if @user
      @user.update(user_params)
      render json: {
        message: 'User updated successfully'
      }, status: 200
    else
      render error: {
        error: 'Unable to update User'
      }, status: 400
    end
  end

  # DELETE /users/:id
  def delete
    @user = User.find(params[:id])
    if @user
      @user.destroy
      render json: {
        message: 'User deleted successfully'
      }, status: 200
    else
      render jso: {
        error: 'Unable to delete User'
      }, status: 400
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name,:last_name,:bio,:age,:gender, :address => [:country, :address_1, :address_2])
  end
end
