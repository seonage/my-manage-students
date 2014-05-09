require 'spec_helper'

describe Student do
  let(:student) { FactoryGirl.build :student}

  describe 'attributes' do
    # Validations

    it { expect(student).to validate_presence_of :name }
    it { expect(student).to validate_presence_of :address }
    it { expect(student).to validate_presence_of :state }
    it { expect(student).to validate_presence_of :country }
    it { expect(student).to validate_presence_of :phone }
    it { expect(student).to validate_presence_of :zip }
    it { expect(student).to validate_presence_of :city }

    it { expect(student).to validate_uniqueness_of :email }

    it { should_not allow_value("test@test").for(:email) }

    # Associations
    it { expect(student).to have_many(:messages) }

    it "save attributes" do
      student.save!
      expect(student).to be_valid
    end
  end
end
