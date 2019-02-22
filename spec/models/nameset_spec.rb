require 'rails_helper'

RSpec.describe "Nameset", type: :model do

  subject do
    Nameset.new(
      label: "Example Nameset",
      subgroup: Subgroup.create!(group: Group.create!(label: "The Example Group")),
      source: %(https://en.wikipedia.org/wiki/Category:Greek_masculine_given_names)
    )
  end

  describe "#label" do

    context "when it's blank" do
      it "is invalid" do
        subject.label = ''
        expect(subject).to be_invalid
        expect(subject.errors[:label]).to include("can't be blank")
      end
    end
    context "when it's nil" do
      it "is invalid" do
        subject.label = nil
        expect(subject).to be_invalid
        expect(subject.errors[:label]).to include("can't be blank")
      end
    end
    context "when it's correct" do
      it "is valid" do
        subject.label = 'The example group'
        expect(subject).to be_valid
      end
    end
    context "when it's longer than 60 characters" do
      it "is invalid" do
        subject.label = "a" * 61
        expect(subject).to be_invalid
        expect(subject.errors[:label]).to include("is too long (maximum is 60 characters)")
      end
    end
    context "when it begins and ends with whitespaces characters" do
      it "is stripped before validation" do
        subject.label = "  \t\n  " + ("a" * 60) + "   \n  \t  "
        expect(subject).to be_valid
        subject.save
        expect(subject.reload.label).to eq ("a" * 60)
      end
    end
    context "when it has whitespaces characters between words" do
      it "they are changed to single spaces before validation" do
        subject.label = "The  \t\n  Example   \n  \t  Label"
        expect(subject).to be_valid
        subject.save
        expect(subject.reload.label).to eq "The Example Label"
      end
    end

  end

  describe "#subgroup" do

    context "when it's nil" do
      it "is invalid" do
        subject.subgroup = nil
        expect(subject).to be_invalid
        expect(subject.errors[:subgroup]).to include("must exist")
      end
    end
    context "when it's correct" do
      it "is valid" do
        expect(subject).to be_valid
      end
    end

  end

  describe "#name_separator" do

    context "when it's nil" do
      it "it is \';\'as default" do
        subject.save
        expect(subject.reload.name_separator).to eq ";"
      end
      it "is valid" do
        expect(subject).to be_valid
      end
    end
    context "when it's blank" do
      it "it is \';\'as default" do
        subject.save
        expect(subject.reload.name_separator).to eq ";"
      end
      it "is valid" do
        expect(subject).to be_valid
      end
    end

  end

  describe "#variant_separator" do

    context "when it's nil" do
      it "it is \',\'as default" do
        subject.save
        expect(subject.reload.variant_separator).to eq ","
      end
      it "is valid" do
        expect(subject).to be_valid
      end
    end
    context "when it's blank" do
      it "it is \',\'as default" do
        subject.save
        expect(subject.reload.variant_separator).to eq ","
      end
      it "is valid" do
        expect(subject).to be_valid
      end

    end

  end


end
