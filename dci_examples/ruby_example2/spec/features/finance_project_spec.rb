require 'spec_helper'

describe "As a registered user I can finance project" do
  subject{ FinanceProjectContext }
  let(:project){ Project.first }
  let(:user){ User.first }

  before do
    SignUpContext.call(name: "cutter")
    CreateProjectContext.call(user, name: "Lemon Knife", end_date: Time.now + 3600 * 24)
    DepositMoneyContext.call(user, 35)
  end

  it "transfer money from user to project" do
    subject.call(user, project, 15)
    expect(project[:funds]).to eq(15)
    expect(user[:funds]).to eq(20)
  end
end