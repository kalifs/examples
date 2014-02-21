require_relative 'models/account'
require_relative 'models/user'
require_relative 'roles/depositing_account'
require_relative 'roles/withdrawing_account'
require_relative 'contexts/transfer_money_between_accounts'

# account = Account.new("someones account")
# p account

# 1. depositing money
#
# account.extend(DepositingAccount)
# account.deposit(44)
# p account

# 2. withdrawing money
#
# account.extend(WithdrawingAccount)
# account.withdraw(30)
# p account

# 3. Transfering funds from one account to another (context)
#
# my_account = Account.new("my account")
# p my_account
# transfer_context = TransferMoneyBetweenAccounts.new(40, account, my_account)
# transfer_context.call

# p account
# p my_account

# 4. transfer that fails
# my_account = Account.new("my account")
# p my_account
# transfer_context = TransferMoneyBetweenAccounts.new(140, account, my_account)
# begin
#   transfer_context.call
# rescue Exception => e
#   p e.message
# ensure
#   p account
#   p my_account
# end


# 5. Full controller example

# 5.1 As a User I want to see my current balance (simple CRUD operation no need for context)
# 5.2 As a User I want to transfer money to other users accounts

USERS = [User.new("John"), User.new("Shaun")]

class AccountsController
  def show(user_id)
    p USERS[user_id].account
  end
end

class TransactionsController
  def create(user_id, seller_id, amount)
    transfer = TransferMoneyBetweenAccounts.new(amount, USERS[user_id].account, USERS[seller_id].account)
    transfer.call
    AccountsController.new.show(user_id)
  end
end

p "John opens his account and looks at his account balance"
AccountsController.new.show(0)
sleep 2
p "Shaun opens his account and looks at his account balance"
AccountsController.new.show(1)
sleep 2
p "John buys good chair from Shaun"
TransactionsController.new.create(0, 1, 30)
sleep 2
p "Shaun looks at his accounts balance"
AccountsController.new.show(1)