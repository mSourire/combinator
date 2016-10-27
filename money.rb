class Money

  attr_reader :type, :amount, :values

  MONEY_TYPES = { pounds: 1, pence: 2 }
  DEFAULT_COIN_FACE_VALUES = [ 1, 2, 5, 10, 20, 50, 100, 200 ]

  def initialize
    get_type
    get_amount
    get_coin_face_values
  end


  private


  def get_type
    while true
      puts "Choose money type: enter '1' for pounds, 2 - for pence or 'exit'"
      @type = get_command(gets).to_i
      break if type_correct?
    end
  end

  def type_correct?
    MONEY_TYPES.values.any?{ |v| v == @type }
  end

  def get_amount
    puts "Enter money amount or 'exit'"
    @amount = Float(get_command(gets))
    process_amount
    raise ArgumentError unless amount_correct?
  rescue ArgumentError
    puts "Money amount must present a number >= 0"
    retry
  end

  def process_amount
    @amount *= 100 if @type == 1 
  end

  def amount_correct?
    @amount >= 0
  end

  def get_coin_face_values
    puts "Enter comma-separated coin face values or 'exit'"
    @values = get_command(gets)
    process_values
    raise ArgumentError unless values_correct?
  rescue ArgumentError
    puts "Coin face values must present numbers > 0"
    retry
  end

  def process_values
    @values = if @values == "\n"
      DEFAULT_COIN_FACE_VALUES
    else
      @values.split(',').map(&:to_i)
    end
  end

  def values_correct?
    @values.all?{ |v| v > 0 }
  end

  def get_command string
    exit if string == "exit\n"
    string
  end
  
end