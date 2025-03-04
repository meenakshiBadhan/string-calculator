class Calculator
  def add(numbers)
    return 0 if numbers.empty?

    # Replace all non-numeric characters with commas
    numbers.gsub!(/[^0-9-]/, ',')

    # Split using commas and convert to integers
    nums = numbers.split(',').map(&:strip).map(&:to_i)

    # Check for negatives
    negatives = nums.select { |n| n < 0 }
    raise "negative numbers not allowed #{negatives.join(',')}" if negatives.any?

    # Return sum
    nums.sum
  end

end
