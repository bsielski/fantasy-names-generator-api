require 'rails_helper'

RSpec.describe "Subgroup#group", type: :model do

  context "when it's nil" do
    it "is invalid" do
      record = Subgroup.new
      record.group = nil
      expect(record).to be_invalid
      expect(record.errors[:group]).to include("must exist")
    end
  end
  context "when it's correct" do
    it "is valid" do
      record = Subgroup.new
      record.group = Group.create!(label: "The Example Label")
      expect(record).to be_valid
    end
  end

end
