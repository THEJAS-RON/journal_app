require 'rails_helper'

RSpec.describe Journal, type: :model do
  it "is valid with valid attributes" do
    user = User.create(email: "test@example.com", password: "password")
    journal = Journal.new(title: "Test Journal", content: "This is a test.", user: user)
    expect(journal).to be_valid
  end

  it "is not valid without a title" do
    journal = Journal.new(title: nil)
    expect(journal).to_not be_valid
  end

  it "is not valid without content" do
    journal = Journal.new(content: nil)
    expect(journal).to_not be_valid
  end
end
