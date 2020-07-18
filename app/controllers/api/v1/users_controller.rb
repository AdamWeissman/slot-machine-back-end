class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def create
    @user = User.create(user_params)
    render json: @user, status: 200
  end

  def show
    @user = User.find_by_id(params[:id])
    render json: @user, status: 200
  end

  def destroy
    @user = User.find_by_id(params[:id])
    @user.destroy
    render json: { message: 'User Deleted' }, status: 200
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end