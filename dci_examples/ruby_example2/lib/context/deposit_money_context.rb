class DepositMoneyContext
  def self.call(user, amount)
    new(user).deposit(amount)
  end

  def initialize(account)
    @user_account = account
    @user_account.extend(Account)
  end

  def deposit(amount)
    @user_account.open(amount)
  end
end