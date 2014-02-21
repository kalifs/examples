

class Account
  attr_accessor :balance, :name

  def initialize(name)
    @name = name
    @balance = 100
  end

  def inspect
    "Balance of #{name}: #{balance}£"
  end

  def to_s
    "#{name}"
  end
end

module DepositingAccount
  def deposit(amount)
    self.balance += amount
  end
end

module WithdrawingAccount
  def can_withdraw?(amount)
    self.balance > amount
  end

  def withdraw(amount)
    self.balance -= amount
  end
end

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

account = Account.new("Arturs")
account.extend(DepositingAccount)
# account.deposit(100)

# me.extend(WithdrawingAccount)
# me.withdraw(30)

my_account = Account.new("Black Cat")
p my_account
transfer_context = TransferMoneyBetweenAccounts.new(140, account, my_account)
begin
  transfer_context.call
rescue Exception => e
  p e.message
ensure
  p account
  p my_account
end

my_account.withdraw(30)