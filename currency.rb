class DCCE < StandardError
  def message
    "DifferentCurrencyErrorCode: To add or subtract Currency, you must use the same Currency Codes."
  end
end

class NaN < StandardError
  def message
    "This is not a number."
  end
end

class Currency
  attr_accessor :code, :amount
  def initialize(code, amount)
    @code = code
    if amount < 0
      STDERR.puts("You cannot input a negative currency...We are ignoring your college loans for now.")
      @amount = amount.abs
    else
      @amount = amount
    end
  end

  def ==(other)
    if other.is_a?(Currency)
      @code == other.code && @amount == other.amount
    else
      false
    end
  end

  def +(other)
    if other.is_a?(Currency) && @code == other.code
      Currency.new(@code, @amount + other.amount)
    else
      raise DCCE
    end
  end

  def -(other)
    if other.is_a?(Currency) && @code == other.code
      Currency.new(@code, @amount - other.amount)
    else
      raise DCCE
    end
  end

  def *(other)
    raise NaN unless other.is_a?(Fixnum) || other.is_a?(Float)
    Currency.new(@code, @amount * other)
  end

  def /(other)
    raise NaN unless other.is_a?(Fixnum) || other.is_a?(Float)
    Currency.new(@code, @amount / other)
  end

end


# Should be initialized with a Hash of currency codes to conversion rates (see link to rates below)

# At first, just make this work with two currency codes and conversation rates, with one rate being 1.0 and the other being the conversation rate. An example would be this: {USD: 1.0, EUR: 0.74}, which implies that a dollar is worth 0.74 euros.


class Codes
  attr_reader :code_set
  def initialize
    @code_set = {
      :USD => 1.0,
      :EUR => 0.88
    }
  end
end

class CurrencyConverter
  attr_accessor :first_rate, :second_rate, :init_amount, :first_code, :second_code
  attr_reader :code_set
  def initialize
    @code_set = Codes.new.code_set
    @init_amount = init_amount
    @first_code = input_first_code
    @second_code = input_second_code
    @first_rate = get_first_rate
    @second_rate = get_second_rate
    @conversion = converter

  end

  def input_first_code # assigns first code
    print "Please enter the currency code you are converting FROM: > "
    gets.chomp
  end

  def get_first_rate # assigns the first rate
    @code_set[@first_code.to_sym]
  end

  def input_second_code
    print "Please enter the currency code you are converting TO: > "
    gets.chomp
  end

  def get_second_rate
    @code_set[@second_code.to_sym]
  end

  def init_amount
    print "Please enter initial numeric amount for conversion: > "
    gets.chomp.to_i
  end

  def converter
    @conversion = (@init_amount * get_first_rate) / get_second_rate
  end

  def display_conversion
    puts "#{@init_amount} in #{@first_code} equals #{@conversion} in #{@second_code}."
  end

  def run
    # puts current_code
    display_conversion
  end



end

CurrencyConverter.new.run
