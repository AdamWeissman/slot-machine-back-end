class Api::V1::BanksController < ApplicationController

  def create
    if logged_in?
      @bank = current_user.bank.build(bank_params)
      if @bank.save
        render json: @bank, status: :accepted
      else
        render json: { error: 'OOPS' }, status: :not_acceptable
      end
    end
  end

  def show
    if logged_in?
      @bank = Bank.find_by_id(params[:id])
      render json: @bank, status: :accepted
    end
  end

  def update
    if logged_in?
      @bank = Bank.find_by_id(params[:id])
      @bank.total = params[:total]
      @bank.save
      render json: @bank, status: :accepted
    end
  end


  private
    def bank_params
      params.permit(:total)
    end


  end