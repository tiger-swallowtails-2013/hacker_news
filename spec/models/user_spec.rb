require 'spec_helper'

describe User do
  let(:user1) {FactoryGirl.build(:user)}
  let(:user2) {FactoryGirl.build(:user)}
  it "has a valid factory" do
   expect(user1).to be_valid
  end
  it "is invalid without an email address" do
    user1.email = nil
    expect(user1).to_not be_valid
  end

  it "is invalid without a password" do
    expect(FactoryGirl.build(:user, password: nil)).to_not be_valid
  end

  it "has a unique email address" do
    user1.save
    user2.email = user1.email
    expect(user2).to_not be_valid
  end

  it "has a password that is at least 6 characters long" do
    user1.password = "food"
    user2.password = "password"
    expect(user1).to_not be_valid
    expect(user2).to be_valid
  end
end
