require 'minitest/autorun'

require_relative './currency.rb'

class CurrencyTest < Minitest::Test
  def currency
    ::Currency.new
    ::DCCE.new
    ::NaN.new
    ::Currency_converter.new
  end


  def test_list_codes
    assert_equal Currency_converter.new(:Currency_code, 10), Currency.new(:USD, 5) + Currency.new(:USD, 5)
  end

  def test_input_first_code
  end
end
