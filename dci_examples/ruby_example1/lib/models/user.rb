class User
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def account
    @account ||= Account.new(name)
  end
end