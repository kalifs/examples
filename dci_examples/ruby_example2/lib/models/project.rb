class Project
  include Model

  def self.collection
    DB[:projects]
  end
end