require 'spec_helper'

describe "As an unregistered user" do
  subject{ SignUpContext }
  let(:user_attributes){ {name: "cutter"} }

  it "Given name I can sign up" do
    expect{ subject.call(user_attributes) }.to change{ User.all.size }.by(1)
  end

  it "Given funds I can sign up, but funds will be ignored" do
    subject.call(user_attributes.merge(funds: 11))
    expect(User.first[:funds]).to eq(nil)
  end
end