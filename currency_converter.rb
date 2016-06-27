class UCCE < StandardError
  def message
    "UnknownCurrencyCodeError: You have input an invalid code. Please review your handbook of codes thoroughly before trying again."
  end
end

class Codes
  attr_reader :code_set, :code_symbols
  def initialize
    @code_set = {
      :USD => [1.0, "$"],
      :EUR => [0.88, "€"],
      :JYP => [0.0098, "¥"]
    }
  end
end

class CurrencyConverter
  attr_accessor :first_rate, :second_rate, :init_amount, :first_code, :second_code
  attr_reader :code_set, :display_codes
  def initialize
    system("clear")
    @code_set = Codes.new.code_set
    @display_codes = display_codes
    @init_amount = init_amount
    @first_code = input_first_code.upcase
    @second_code = input_second_code.upcase
  end

  def run
    display_conversion
  end

  def display_codes
    print "This converter converts currency in the following Currency Codes: "
    @code_set.each_key { |keys| print "\s#{keys} " }
    puts
    puts
  end

  def init_amount
    print "Please enter initial numeric amount for conversion: > "
    gets.chomp.to_i
  end

  def raise_error
    response = gets.chomp
    if @code_set.has_key?(response.upcase.to_sym)
      return response
    else
      raise UCCE
    end
  end

  def input_first_code # gets input >> @first_code >> get_first_rate && first_symbol >> converter >> display conversion
    print "Please enter the currency code you are converting FROM: > "
    raise_error
  end

  def get_first_rate # assigns the first rate
    @code_set[@first_code.to_sym][0]
  end

  def first_symbol
    "#{@code_set[@first_code.to_sym][1]}"
  end

  def input_second_code # gets input >> @second_code >> get_second_rate && second_symbol >> converter >> display conversion
    print "Please enter the currency code you are converting TO: > "
    raise_error
  end

  def get_second_rate
    @code_set[@second_code.to_sym][0]
  end

  def second_symbol
    "#{@code_set[@second_code.to_sym][1]}"
  end

  def converter
    '%.2f' % ((@init_amount * get_first_rate) / get_second_rate)
  end

  def display_conversion
    result = "#{first_symbol}#{@init_amount} #{@first_code} equals #{second_symbol}#{converter} #{@second_code}."
    puts
    puts result
    return result
  end
end

CurrencyConverter.new.run
