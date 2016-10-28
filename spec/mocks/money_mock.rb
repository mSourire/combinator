class Money
  attr_reader :loops_number, :error_count

  def loop
    @loops_number = 0
    7.times do
      @loops_number += 1
      yield
    end
  end

  def set_amount
    puts "Enter money amount or 'exit'"
    @amount = Float(get_command(STDIN.gets))
    process_amount
    raise ArgumentError unless amount_correct?
  rescue ArgumentError
    @error_count ||= 0
    @error_count += 1
    puts "Money amount must present a number >= 0"
    retry unless @error_count == 5
  end

  def set_coin_face_values
    puts "Enter comma-separated coin face values or 'exit'"
    process_values(get_command(STDIN.gets))
    raise ArgumentError unless values_correct?
  rescue ArgumentError
    @error_count ||= 0
    @error_count += 1
    puts "Coin face values must present numbers > 0"
    retry unless @error_count == 5
  end
  
end