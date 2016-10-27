class Combinator

  def self.get_combinations_number amount, values
    combinations = Array.new(amount + 1, 0)
    combinations[0] = 1

    values.each_with_index do |e, i|
    	while e <= amount
        combinations[e] += combinations[e - values[i]]
        e += 1
    	end
    end
    combinations[combinations.length - 1]
  end

end

