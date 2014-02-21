class FinanceProjectContext
  def self.call(account, project, amount)
    context = new(account)
    context.back(project, amount)
  end

  def initialize(account)
    @user_account = account
    @user_account.extend(Account)
    unless @user_account.opened?
      @user_account.open(0)
    end
  end

  def back(project_account, amount)
    #transaction would help
    project_account.extend(Account)
    @user_account.take(amount)
    unless project_account.opened?
      project_account.open(0)
    end
    project_account.give(amount)
  end
end