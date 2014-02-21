class TransferMoneyBetweenAccounts
  attr_accessor :amount, :from, :to

  def initialize(amount, from, to)
    @amount, @from, @to = amount, from, to
  end

  def call
    self.from.extend(WithdrawingAccount)
    self.to.extend(DepositingAccount)

    if from.can_withdraw?(amount)
      from.withdraw(amount)
      to.deposit(amount)
    else
      raise Exception.new("Not enough money in #{from}. Needed #{amount}, available #{from.balance}")
    end
  end
end