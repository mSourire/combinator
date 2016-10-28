class Combinator

  def self.get_combinations_number amount, values
    combinations = Array.new(amount + 1, 0)
    combinations[0] = 1
    values.each_with_index do |value, idx|
    	while value <= amount
        combinations[value] += combinations[value - values[idx]]
        value += 1
    	end
    end
    combinations[combinations.length - 1]
  end

end
