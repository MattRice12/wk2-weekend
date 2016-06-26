require 'minitest/autorun'

require_relative './currency.rb'

class CurrencyTest < Minitest::Test
  def currency
    # ::Currency.new
    # ::DCCE.new
    # ::NaN.new
    ::CurrencyConverter.new
  end

  # def test_equality
  #   assert_equal Currency.new(:USD, 5), Currency.new(:USD, 5)
  # end
  #
  # def test_different_code
  #   assert_raises(DCCE){ Currency.new(:USD, 5) + Currency.new(:EUD, 5) }
  # end
  #
  # def test_not_a_number
  #   assert_raises(DCCE){ Currency.new(:USD, 5) + Currency.new(:EUD, 5) }
  # end
  #
  # def test_addition
  #   assert_equal Currency.new(:USD, 10), Currency.new(:USD, 5) + Currency.new(:USD, 5)
  # end
  #
  # def test_subtraction
  #   assert_equal Currency.new(:USD, 10), Currency.new(:USD, 20) - Currency.new(:USD, 10)
  # end
  #
  # def test_multiplication
  #   assert_equal Currency.new(:USD, 100), Currency.new(:USD, 10) * 10
  # end
  #
  # def test_division
  #   assert_equal Currency.new(:USD, 10), Currency.new(:USD, 100) / 10
  # end
  #
  # def test_negative_currency
  #   assert_equal Currency.new(:USD, 15), Currency.new(:USD, 5) + Currency.new(:USD, - 10)
  # end

#_____________________________________________________________

# def test_list_codes
#   assert_equal "{:USD=>1.0, :EUR=>0.88}", "#{Codes.new.code_set}"
# end
  #
  # def test_get_first_rate
  #   puts "TYPE USD"
  #   assert_equal 1.0, currency.get_first_rate
  # end

  # def test_get_second_rate
  #   puts "TYPE EUR"
  #   assert_equal 0.88, currency.get_second_rate
  # end
  #
  def test_converter
    puts "50 >> USD >> EUR"
    assert_equal 56, currency.converter.to_i
  end
end
