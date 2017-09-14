require 'rails_helper'

RSpec.describe "Group#label", type: :model do

  context "when it's blank" do
    it "is invalid" do
      record = Group.new
      record.label = ''
      expect(record).to be_invalid
      expect(record.errors[:label]).to include("can't be blank")
    end
  end
  context "when it's nil" do
    it "is invalid" do
      record = Group.new
      record.label = nil
      expect(record).to be_invalid
      expect(record.errors[:label]).to include("can't be blank")
    end
  end
  context "when it's correct" do
    it "is valid" do
      record = Group.new
      record.label = 'The example group'
      expect(record).to be_valid
    end
  end
  context "when it's longer than 100 characters" do
    it "is invalid" do
      record = Group.new
      record.label = "a" * 101
      expect(record).to be_invalid
      expect(record.errors[:label]).to include("is too long (maximum is 100 characters)")
    end
  end
  context "when it begins and ends with whitespaces characters" do
    it "is stripped before validation" do
      record = Group.new
      record.label = "  \t\n  " + ("a" * 100) + "   \n  \t  "
      expect(record).to be_valid
      record.save
      expect(record.reload.label).to eq ("a" * 100)
    end
  end

  context "when it has whitespaces characters between words" do
    it "they are changed to single spaces before validation" do
      record = Group.new
      record.label = "The  \t\n  Example   \n  \t  Label"
      expect(record).to be_valid
      record.save
      expect(record.reload.label).to eq "The Example Label"
    end
  end


end
