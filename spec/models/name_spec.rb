require 'rails_helper'

RSpec.describe Name, type: :model do
  subject do
    Name.new(
      variants: "Example",
      nameset: Nameset.create!(
        label: "Example Nameset",
        source: %(https://en.wikipedia.org/wiki/Category:Greek_masculine_given_names),
        subgroup: Subgroup.create!(group: Group.create!(label: "The Example Group")))
    )
  end

  describe "#nameset" do
    context "when it's nil" do
      it "is invalid" do
        subject.nameset = nil
        expect(subject).to be_invalid
        expect(subject.errors[:nameset]).to include("must exist")
      end
    end
    context "when it's correct" do
      it "is valid" do
        expect(subject).to be_valid
      end
    end
  end

  describe "#variants" do
    context "when it's blank" do
      it "is invalid" do
        subject.variants = ''
        expect(subject).to be_invalid
        expect(subject.errors[:variants]).to include("can't be blank")
      end
    end
    context "when it's nil" do
      it "is invalid" do
        subject.variants = nil
        expect(subject).to be_invalid
        expect(subject.errors[:variants]).to include("can't be blank")
      end
    end
    context "when it's correct" do
      it "is valid" do
        expect(subject).to be_valid
      end
    end
  end

end
