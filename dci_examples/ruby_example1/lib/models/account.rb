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