require_relative 'combinator'

class MoneyCalculation

  def self.get_coin_combinations money
    puts Combinator.get_combinations_number(money.amount, money.values)
  end

end