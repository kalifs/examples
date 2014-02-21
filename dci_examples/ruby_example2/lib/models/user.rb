class User
  include Model

  def self.collection
    DB[:users]
  end
end