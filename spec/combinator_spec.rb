require 'rspec'
require_relative '../combinator'

describe Combinator do

  describe ".get_combinations_number" do
    context "when amount = 0, values = [1]" do
      it "equals 1" do
        expect(Combinator.get_combinations_number 0, [1]).to be_eql 1
      end
    end

    context "when amount = 2, values = [1]" do
      it "equals 1" do
        expect(Combinator.get_combinations_number 2, [1]).to be_eql 1
      end
    end

    context "when amount = 2, values = [1,2]" do
      it "equals 2" do
        expect(Combinator.get_combinations_number 2, [1,2]).to be_eql 2
      end
    end

    context "when amount = 5, values = [1,2,3]" do
      it "equals 5" do
        expect(Combinator.get_combinations_number 5, [1,2,3]).to be_eql 5
      end
    end
  end

end
