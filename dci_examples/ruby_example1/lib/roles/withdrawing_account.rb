module WithdrawingAccount
  def can_withdraw?(amount)
    self.balance > amount
  end

  def withdraw(amount)
    self.balance -= amount
  end
end