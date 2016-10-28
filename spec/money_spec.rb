require 'rspec'
require_relative '../money'
require_relative 'mocks/money_mock'


describe Money do

  before :each do
    @money = Money.new
  end

  context "when just initialized" do
    it "has default not nil values" do
      expect(@money.type).to be_eql 2
      expect(@money.amount).to be_eql 200.0
      expect(@money.values).to be_eql Money::DEFAULT_COIN_FACE_VALUES
    end
  end

  describe "#set_type" do
    context "when correct type provided by user" do
      it "sets the type as a value of @type and executes one iteration only" do
        allow(STDIN).to receive(:gets) { "1\n" }
        @money.set_type
        expect(@money.type).to be_eql 1
        expect(@money.loops_number).to be_eql 1
        
        allow(STDIN).to receive(:gets) { "2\n" }
        @money.set_type
        expect(@money.type).to be_eql 2
        expect(@money.loops_number).to be_eql 1
      end
    end

    context "when incorrect type provided by user" do
      it "sets the type as a value of @type and keeps iterating, asking for a correct type" do
        allow(STDIN).to receive(:gets) { "5\n" }
        @money.set_type
        expect(@money.loops_number).to be_eql 7

        allow(STDIN).to receive(:gets) { "-1\n" }
        @money.set_type
        expect(@money.loops_number).to be_eql 7

        allow(STDIN).to receive(:gets) { "fsdsdf\n" }
        @money.set_type
        expect(@money.loops_number).to be_eql 7

        allow(STDIN).to receive(:gets) { "\n" }
        @money.set_type
        expect(@money.loops_number).to be_eql 7

        allow(STDIN).to receive(:gets) { "" }
        @money.set_type
        expect(@money.loops_number).to be_eql 7
      end
    end

    context "when 'exit' is provided by user" do
      it 'stops the script with code 0' do
        allow(STDIN).to receive(:gets) { "exit\n" }
        begin
          @money.set_type
        rescue SystemExit => e
          expect(e.status).to be_eql(0)
        end
      end
    end

  end


  describe "#set_amount" do

    context "when correct money amount provided by user" do
      it "sets the amount as a value of @amount which must be a float" do
        allow(STDIN).to receive(:gets) { "0\n" }
        @money.set_amount
        expect(@money.amount).to be_eql 0.0
      end
    end

    context "when correct money amount provided by user and money type is pounds" do
      it "multiplies the amount by 100, sets @amount to the value and cganges type to pence" do
        allow(STDIN).to receive(:gets) { "1\n" }
        @money.set_type
        
        allow(STDIN).to receive(:gets) { "2\n" }
        @money.set_amount
        expect(@money.amount).to be_eql 200.0
        expect(@money.type).to be_eql 2
      end
    end

    context "when correct money amount provided by user and money type is pence" do
      it "sets @amount to the provided value" do
        allow(STDIN).to receive(:gets) { "2\n" }
        @money.set_type
        
        allow(STDIN).to receive(:gets) { "2\n" }
        @money.set_amount
        expect(@money.amount).to be_eql 2.0
      end
    end

    context "when not a numerical string provided by user" do
      it "raises ArgumentError and retries" do
        allow(STDIN).to receive(:gets) { "Hello\n" }
        @money.set_amount
        expect(@money.error_count).to be_eql 5
      end
    end

    context "when a negative number provided by user" do
      it "raises ArgumentError and retries" do
        allow(STDIN).to receive(:gets) { "-1\n" }
        @money.set_amount
        expect(@money.error_count).to be_eql 5
      end
    end

    context "when 'exit' is provided by user" do
      it 'stops the script with code 0' do
        allow(STDIN).to receive(:gets) { "exit\n" }
        begin
          @money.set_amount
        rescue SystemExit => e
          expect(e.status).to be_eql(0)
        end
      end
    end

  end


  describe "#set_coin_face_values" do

    context "when correct coin face values provided by user" do
      it "parses the string, saves it to @values and doesn't raise ArgumentError" do
        allow(STDIN).to receive(:gets) { "1,2,5,10,50\n" }
        @money.set_coin_face_values
        expect(@money.values).to be_eql [1,2,5,10,50] 
        expect(@money.error_count).to be_nil
      end
    end

    context "when an empty string provided by user" do
      it "leaves @values without changes and doesn't raise ArgumentError" do
        allow(STDIN).to receive(:gets) { "\n" }
        @money.set_coin_face_values
        expect(@money.values).to be_eql Money::DEFAULT_COIN_FACE_VALUES
        expect(@money.error_count).to be_nil
      end
    end

    context "when not a completely numerical string provided by user" do
      it "raises ArgumentError and retries" do
        allow(STDIN).to receive(:gets) { "l,2,5,l0,50\n" }
        @money.set_coin_face_values
        expect(@money.error_count).to be_eql 5
      end
    end

    context "when string with a zero or a negative number provided by user" do
      it "raises ArgumentError and retries" do
        allow(STDIN).to receive(:gets) { "0,2,5,-10,50\n" }
        @money.set_coin_face_values
        expect(@money.error_count).to be_eql 5
      end
    end

    context "when 'exit' is provided by user" do
      it 'stops the script with code 0' do
        allow(STDIN).to receive(:gets) { "exit\n" }
        begin
          @money.set_coin_face_values
        rescue SystemExit => e
          expect(e.status).to be_eql(0)
        end
      end
    end

  end

end
