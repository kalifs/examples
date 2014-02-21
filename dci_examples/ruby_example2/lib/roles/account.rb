module Account

  def open(amount)
    self[:funds] = amount
    self.save
  end

  def opened?
    self[:funds]
  end

  def take(amount)
    self[:funds] -= amount
    self.save
  end

  def give(amount)
    self[:funds] += amount
    self.save
  end
end