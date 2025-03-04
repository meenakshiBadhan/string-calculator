require_relative '../services/calculator'

class CalculatorController < ApplicationController
  # GET /calculator/new
  # Render the form to input numbers
  def new
  end

  # POST /calculator/create
  # Add the numbers
  def create
    @sum = Calculator.new.add(params[:numbers])
    render :show
  rescue => e
    @error = e.message
    render :new
  end

  # GET /calculator/show
  # Show the sum of the numbers
  def show
  end
end