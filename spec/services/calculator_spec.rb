# spec/services/calculator_spec.rb
require 'rails_helper'
require_relative '../../app/services/calculator'

RSpec.describe Calculator do
  describe '#add' do
    it 'returns 0 for an empty string' do
      calculator = Calculator.new
      expect(calculator.add("")).to eq(0)
    end

    it 'returns the number itself for a single number' do
      calculator = Calculator.new
      expect(calculator.add("1")).to eq(1)
    end

    it 'returns sum for two comma-separated numbers' do
      calculator = Calculator.new
      expect(calculator.add("1,5")).to eq(6)
    end

    it 'returns sum for multiple numbers' do
      calculator = Calculator.new
      expect(calculator.add("1,2,3")).to eq(6)
    end

    it 'handles new lines between numbers' do
      calculator = Calculator.new
      expect(calculator.add("1\n2,3")).to eq(6)
    end

    it 'supports custom delimiters' do
      calculator = Calculator.new
      expect(calculator.add("//;\n1;2")).to eq(3)
    end

    it 'raises an exception for negative numbers' do
      calculator = Calculator.new
      expect { calculator.add("1,-2,3") }.to raise_error("negative numbers not allowed -2")
    end

    it 'shows all negative numbers in the exception message' do
      calculator = Calculator.new
      expect { calculator.add("1,-2,3,-5") }.to raise_error("negative numbers not allowed -2,-5")
    end
  end
end
