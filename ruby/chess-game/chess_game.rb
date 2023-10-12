module Chess
  extend self

  RANKS = 1..8
  FILES = 'A'..'H'

  def valid_square?(rank, file)
    RANKS.include?(rank) and FILES.include?(file)
  end

  def nick_name(first_name, last_name)
    (first_name[0,2] + last_name[-2,2]).upcase
  end

  def move_message(first_name, last_name, square)
    valid_square?(square[1].to_i, square[0]) ?
      "#{nick_name(first_name, last_name)} moved to #{square}" :
      "#{nick_name(first_name, last_name)} attempted to move to #{square}, but that is not a valid square" 
  end
end
