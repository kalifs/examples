require 'spec_helper'

describe "As a user I can deposit money to my account" do
  subject{ DepositMoneyContext }
  let(:user){ User.first }

  before do
    SignUpContext.call(name: "cutter")
  end

  it "adds given amount to user's funds" do
    expect(user[:funds]).to eq(nil)
    subject.call(user, 100)
    expect(user[:funds]).to eq(100)
  end
end