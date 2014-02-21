require 'spec_helper'

describe 'As a registered user I can create project' do
  subject{ CreateProjectContext }
  let(:user){ User.collection[:id => User.create(name: "user")] }
  let(:attributes){ {name: "Lemon Knife", end_date: Time.now + 3600 * 24 * 7} }

  it 'creates new project for given user with given attributes' do
    expect{ subject.call(user, attributes) }.to change{ Project.all.size }.by(1)
    expect(Project.first[:name]).to eq("Lemon Knife")
    expect(Project.first[:owner_id]).to eq(user[:id])
  end

  it 'forbids to add funds when project is created' do
    expect(Project.all.size).to eq(0)
    subject.call(user, attributes.merge(funds: 500))
    expect(Project.first[:funds]).to be_nil
  end
end