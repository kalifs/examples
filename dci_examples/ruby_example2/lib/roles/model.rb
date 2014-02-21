module Model

  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def create(attributes)
      collection.insert(attributes)
    end

    def all
      collection.all.map{|attributes| new(attributes)}
    end

    def first
      new(collection.first)
    end
  end

  def initialize(attributes)
    @attributes = attributes || {}
    @id = @attributes[:id]
  end

  def []=(key, value)
    @attributes[key] = value
  end

  def [](key)
    @attributes[key]
  end

  def collection
    self.class.collection
  end

  def save
    if @id
      collection.where('id = ?', @id).update(@attributes)
    else
      @id = self.class.create(@attributes)
    end
  end

end