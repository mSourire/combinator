require 'rspec'
require_relative '../money'
require_relative '../money_calculation'

describe MoneyCalculation do

  describe ".get_coin_combinations" do
    it "takes Money instance as a parameter, provides it to Combinator and outputs result" do
      expect(STDOUT).to receive(:puts).with(73682)
      MoneyCalculation.get_coin_combinations(Money.new)
    end
  end

end


