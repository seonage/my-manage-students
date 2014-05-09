require 'spec_helper'

describe "Students" do
  let(:authed_user) { create_logged_in_user }
  describe "GET /students" do
    it "works! (now write some real specs)" do
      get students_path(authed_user)
      response.status.should be(200)
    end
  end
end
