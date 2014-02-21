class SignUpContext
  def self.call(user_attributes)
    context = new(user_attributes)
    context.call
  end

  def initialize(attributes)
    @attributes = attributes
    @attributes.extend(SanitizedAttributes)
  end

  def call
    user = User.new(@attributes.sanitize)
    user.save
  end
end