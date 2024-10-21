class ExpendituresController < ApplicationController
  before_action :set_expenditure, only: [:show, :update, :destroy]

  def index
    expenditures = current_user.expenditures
    render json: expenditures
  end

  def show
    render json: @expenditure
  end

  def create
    expenditure = current_user.expenditures.build(expenditure_params)
    if expenditure.save
      render json: expenditure, status: :created
    else
      render json: expenditure.errors, status: :unprocessable_entity
    end
  end

  def update
    if @expenditure.update(expenditure_params)
      render json: @expenditure
    else
      render json: @expenditure.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @expenditure.destroy
    head :no_content
  end

  private

  def set_expenditure
    @expenditure = current_user.expenditures.find(params[:id])
  end

  def expenditure_params
    params.require(:expenditure).permit(:amount, :category, :month)
  end
end
