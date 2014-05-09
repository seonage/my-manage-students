require 'spec_helper'

describe "Messages" do
  let(:authed_user) { create_logged_in_user }
  let(:student) {FactoryGirl.create :student}
  describe "GET /messages" do

    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers

      get student_messages_path(student, authed_user)
      response.status.should be(200)
    end
  end
end
