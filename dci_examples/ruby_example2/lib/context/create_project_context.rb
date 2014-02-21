class CreateProjectContext
  def self.call(user, project_attributes)
    context = new(user, project_attributes)
    context.call
  end

  def initialize(user, project_attributes)
    @user = user
    @project_attributes = project_attributes
    @project_attributes.extend(SanitizedAttributes)
  end

  def call
    Project.create(@project_attributes.sanitize.merge(owner_id: @user[:id]))
  end
end