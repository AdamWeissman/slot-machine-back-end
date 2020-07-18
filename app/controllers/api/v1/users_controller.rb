class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def create
    @user = User.create(user_params)
    if @user.valid?
      @token = encode_token(user_id: @user.id)
      render json: { user: @user, jwt: @token }, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end

  def show
    @user = User.find_by(params[:id])
    render json: @user
  end

  def destroy
    if current_user = User.find_by(params[:id])
      current_user.destroy
      render json: { message: 'user successfull destroyed'}
    else
      render json: { error: 'failed to destroy user' }, status: :not_acceptable
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end