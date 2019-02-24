require 'rails_helper'

RSpec.describe "Group", type: :model do

  before :context do
    @g1 = Group.create!(label: "Traditional Celtic names")
    @g1a = Subgroup.create!(group: @g1)
    @n1a1 = Nameset.create!(label: "Scottish male", subgroup: @g1a)
    Name.create!(nameset: @n1a1, variants: "Boisil")
    Name.create!(nameset: @n1a1, variants: "Feargan")
    Name.create!(nameset: @n1a1, variants: "Taran")
    @n1a2 = Nameset.create!(label: "Scottish female", subgroup: @g1a)
    Name.create!(nameset: @n1a2, variants: "Brianag")
    Name.create!(nameset: @n1a2, variants: "Fionnghuala")
    Name.create!(nameset: @n1a2, variants: "Muireall")
    @g1b = Subgroup.create!(group: @g1)
    @n1a1 = Nameset.create!(label: "Irish male", subgroup: @g1b)
    @n1a2 = Nameset.create!(label: "Irish female", subgroup: @g1b)

    g2 = Group.create!(label: "Traditional Germanic names")
    g2a = Subgroup.create!(group: g2)
    ns2a1 = Nameset.create!(label: "Frankish male", subgroup: g2a)
    Name.create!(nameset: ns2a1, variants: "Einhard")
    Name.create!(nameset: ns2a1, variants: "Nordbert")
    ns2a2 = Nameset.create!(label: "Frankish female", subgroup: g2a)
    # no names
    # no names
    g2b = Subgroup.create!(group: g2)
    ns2b1 = Nameset.create!(label: "Gothic male", subgroup: g2b)
    Name.create!(nameset: ns2b1, variants: "Ermanaric")
    Name.create!(nameset: ns2b1, variants: "Totila")
    ns2b2 = Nameset.create!(label: "Gothic female", subgroup: g2b)
    Name.create!(nameset: ns2b2, variants: "Helchen")
    Name.create!(nameset: ns2b2, variants: "Sunigilda")
    g2c = Subgroup.create!(group: g2)
    ns2c1 = Nameset.create!(label: "Norse male", subgroup: g2c)
    Name.create!(nameset: ns2c1, variants: "Lodin")
    Name.create!(nameset: ns2c1, variants: "Urm")
    ns2c2 = Nameset.create!(label: "Norse female", subgroup: g2c)
    Name.create!(nameset: ns2c2, variants: "Asa")
    Name.create!(nameset: ns2c2, variants: "Gunnhild")
    g3 = Group.create!(label: "Other traditional names")
  end
  after :context do
    Name.destroy_all
    Nameset.destroy_all
    Subgroup.destroy_all
    Group.destroy_all
  end

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
    context "when new object is creating with position nil" do
      it "has the last position" do
        subject.save
        Group.create!(label: "Second Group")
        expect(Group.last.position).to eq Group.count
      end
    end

  end

end
