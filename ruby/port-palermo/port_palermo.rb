module Port
  extend self
  IDENTIFIER = :PALE

  def get_identifier(city)
    city[0..3].upcase.to_sym
  end

  def get_terminal(ship_identifier)
    return :A if ["OIL", "GAS"].include? ship_identifier[0..2]
    :B
  end
end
