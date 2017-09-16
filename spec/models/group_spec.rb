require 'rails_helper'

RSpec.describe "Group", type: :model do
  subject do
    Group.new(
      label: "Example Group",
      position: 1
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
    context "when it's longer than 100 characters" do
      it "is invalid" do
        subject.label = "a" * 101
        expect(subject).to be_invalid
        expect(subject.errors[:label]).to include("is too long (maximum is 100 characters)")
      end
    end
    context "when it begins and ends with whitespaces characters" do
      it "is stripped before validation" do
        subject.label = "  \t\n  " + ("a" * 100) + "   \n  \t  "
        expect(subject).to be_valid
        subject.save
        expect(subject.reload.label).to eq ("a" * 100)
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

  describe "#position" do

    context "when it's nil" do
      it "is valid" do
        subject.position = nil
        expect(subject).to be_valid
      end
      it "is changed to integer after save" do
        subject.position = nil
        subject.save
        expect(subject.reload.position).to be_instance_of Integer
      end

    end

  end

end
