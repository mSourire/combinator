require_relative 'money'
require_relative 'money_calculation'

while true
  MoneyCalculation.get_coin_combinations(Money.new)
end
