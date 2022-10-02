require 'rails_helper'

RSpec.describe Customer, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  subject {Customer.new(first_name: "Jack", last_name: "Smith", phone: "8889995678")}

    it "is valid with valid attributes" do 
      expect(subject).to be_valid
    end

    it "is not valid without a first_name" do
      subject.first_name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a last_name" do
      subject.last_name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a phone number" do
      subject.phone = nil
      expect(subject).to_not be_valid
    end

    it "is not valid if the phone number is not 10 chars" do
      expect(subject.phone.length).to eq(10)
    end

    it "is not valid if the phone number is not all digits" do
      expect((subject.phone).match?(/\A-?\d+\z/)).to eq(true)
    end
end
