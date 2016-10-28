require_relative 'money'
require_relative 'money_calculation'

while true
  money = Money.new
  money.set_type
  money.set_amount
  money.set_coin_face_values
  MoneyCalculation.get_coin_combinations(money)
end
