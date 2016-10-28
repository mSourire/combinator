class Money

  attr_reader :type, :amount, :values

  MONEY_TYPES = { pounds: 1, pence: 2 }
  DEFAULT_COIN_FACE_VALUES = [ 1, 2, 5, 10, 20, 50, 100, 200 ]

  def initialize
    @type, @amount, @values = 2, 200.0, DEFAULT_COIN_FACE_VALUES
  end

  def set_type
    loop do
      puts "Choose money type: enter '1' for pounds, 2 - for pence or 'exit'"
      @type = get_command(STDIN.gets).to_i
      break if type_correct?
    end
  end

  def set_amount
    puts "Enter money amount or 'exit'"
    @amount = Float(get_command(STDIN.gets))
    process_amount
    raise ArgumentError unless amount_correct?
  rescue ArgumentError
    puts "Money amount must present a number >= 0"
    retry
  end

  def set_coin_face_values
    puts "Enter comma-separated coin face values or 'exit'"
    process_values(get_command(STDIN.gets))
    raise ArgumentError unless values_correct?
  rescue ArgumentError
    puts "Coin face values must present numbers > 0"
    retry
  end


  private


  def type_correct?
    MONEY_TYPES.values.any?{ |v| v == @type }
  end

  def process_amount
    if @type == 1
      @amount *= 100 
      @type = 2
    end
  end

  def amount_correct?
    @amount >= 0
  end

  def process_values input_string
    @values = input_string.split(',').map(&:to_i) unless input_string == "\n"
  end

  def values_correct?
    @values.all?{ |v| v > 0 }
  end

  def get_command string
    exit if string == "exit\n"
    string
  end
  
end
