require 'minitest/autorun'

require_relative './currency_converter.rb'

class CurrencyTest < Minitest::Test
  def currency
    ::UCCE.new
    ::CurrencyConverter.new
  end

#INSTRUCTIONS!!!! TYPE 50 >> USD >> EUR in all of the tests. 2 are going to fail --> test_different_code and test_display_codes; for these, test separately. test_display_codes will still fail, but only because the method is screwy with prints/puts and frankly I can't figure out how to fix it without altering currency_converter.rb more than I want to for a single test.

  def test_list_codes
    assert_equal "{:USD=>[1.0, \"$\"], :EUR=>[0.88, \"€\"], :JYP=>[102.17, \"¥\"]}", "#{Codes.new.code_set}"
  end

  def test_display_codes
    puts "Instructions: TYPE 50 >> USD >> EUR"
    puts "Preface: This should work, but the print/puts throws it off."
    assert_equal "This converter converts currency in the following Currency Codes:  USD  EUR  JYP", CurrencyConverter.new.display_codes
  end

  def test_get_first_rate
    puts "Instructions: TYPE 50 >> USD >> EUR"
    assert_equal 1.0, currency.get_first_rate
  end

  def test_get_second_rate
    puts "Instructions: TYPE 50 >> USD >> EUR"
    assert_equal 0.88, currency.get_second_rate
  end

  def test_converter
    puts "50 >> USD >> EUR"
    assert_equal 56, currency.converter.to_i
  end

  def test_different_code
    puts "Instructions: TYPE 50 >> asdf"
    assert_raises(UCCE){ CurrencyConverter.new }
  end

  def test_display_conversion
    puts "Instructions: TYPE 50 >> USD >> EUR"
    assert_equal "$50 USD equals €56.82 EUR.", CurrencyConverter.new.run
  end
end
