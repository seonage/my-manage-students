require 'spec_helper'

describe Message do
  let(:message) { FactoryGirl.build :message}

  describe 'attributes' do
    # Validations

    it { expect(message).to validate_presence_of :title }
    it { expect(message).to validate_presence_of :content }

    # Associations
    it { expect(message).to belong_to(:user) }
    it { expect(message).to belong_to(:student) }

    it "save attributes" do
      message.save!
      expect(message).to be_valid
    end
  end
end
