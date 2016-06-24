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
  attr_reader :code, :amount
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
