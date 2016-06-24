require 'minitest/autorun'

require_relative './currency.rb'

class CurrencyTest < Minitest::Test
  def currency
    ::Currency.new
    ::DCCE.new
    ::NaN.new
  end

  def test_equality
    assert_equal Currency.new(:USD, 5), Currency.new(:USD, 5)
  end

  def test_different_code
    assert_raises(DCCE){ Currency.new(:USD, 5) + Currency.new(:EUD, 5) }
  end

  def test_not_a_number
    assert_raises(DCCE){ Currency.new(:USD, 5) + Currency.new(:EUD, 5) }
  end

  def test_addition
    assert_equal Currency.new(:USD, 10), Currency.new(:USD, 5) + Currency.new(:USD, 5)
  end

  def test_subtraction
    assert_equal Currency.new(:USD, 10), Currency.new(:USD, 20) - Currency.new(:USD, 10)
  end

  def test_multiplication
    assert_equal Currency.new(:USD, 100), Currency.new(:USD, 10) * 10
  end

  def test_division
    assert_equal Currency.new(:USD, 10), Currency.new(:USD, 100) / 10
  end

  def test_negative_currency
    assert_equal Currency.new(:USD, 15), Currency.new(:USD, 5) + Currency.new(:USD, - 10)
  end

end
