require 'spec_helper'

describe "students/show" do
  before(:each) do
    @student = assign(:student, stub_model(Student,
       :name => "T-Name",
       :address => "T-Address",
       :state => "T-State",
       :country => "T-Country",
       :phone => "T-Phone",
       :zip => "T-Zip",
       :city => "T-City",
       :email => "email2@test.com"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/T-Name/)
    rendered.should match(/T-Address/)
    rendered.should match(/T-State/)
    rendered.should match(/T-Country/)
    rendered.should match(/T-Phone/)
    rendered.should match(/T-Zip/)
    rendered.should match(/T-City/)
    rendered.should match(/email2@test.com/)
  end
end
