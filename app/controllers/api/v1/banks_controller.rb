class Api::V1::BanksController < ApplicationController

  def create
    bank = current_user.bank.build(bank_params)
    if bank.save
      render json: bank, status: :accepted
    else
      render json: { error: 'OOPS' }, status: :not_acceptable
    end
  end

  def show
    bank = Bank.find_by_id(params[:id])
    render json: bank, status: :accepted
  end


  private

    def bank_params
      params.permit(:total)
    end


  end