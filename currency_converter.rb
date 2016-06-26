# Should be initialized with a Hash of currency codes to conversion rates (see link to rates below)

# At first, just make this work with two currency codes and conversation rates, with one rate being 1.0 and the other being the conversation rate. An example would be this: {USD: 1.0, EUR: 0.74}, which implies that a dollar is worth 0.74 euros.


class Currency_converter
  attr_accessor :code, :list_codes, :code_list
  def initialize
    @code = code

  end

  def list_codes
    code_list = [ { :Currency_code => "#{code}" } ]
    puts code_list
  end

  def run
    list_codes
  end

end

Currency_converter.new.run
