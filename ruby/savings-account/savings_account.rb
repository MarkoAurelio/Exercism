module SavingsAccount
  extend self

  def interest_rate(balance)
    return 3.213 if balance.negative?
    case balance
    when 0..999.999
      0.5
    when 1_000..4_999.999
      1.621
    else
      2.475
    end
  end

  def annual_balance_update(balance)
    return 0 if balance.zero?
    balance + (balance * interest_rate(balance) / 100)
  end

  def years_before_desired_balance(current_balance, desired_balance)
    years = 0
    balance = current_balance
    until balance >= desired_balance
      balance = annual_balance_update(balance)
      years += 1
    end
    years
  end
end


