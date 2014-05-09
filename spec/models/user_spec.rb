require 'spec_helper'

describe User do
  let(:user) { FactoryGirl.build :user}

  describe 'attributes' do
    # Associations
    it { expect(user).to have_many(:messages) }

    it "save attributes" do
      user.save!
      expect(user).to be_valid
    end
  end
end
