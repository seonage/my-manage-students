require 'spec_helper'

describe "students/edit" do
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

  it "renders the edit student form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", student_path(@student), "post" do
      assert_select "input#student_name[name=?]", "student[name]"
      assert_select "input#student_address[name=?]", "student[address]"
      assert_select "input#student_state[name=?]", "student[state]"
      assert_select "input#student_country[name=?]", "student[country]"
      assert_select "input#student_phone[name=?]", "student[phone]"
      assert_select "input#student_email[name=?]", "student[email]"
      assert_select "input#student_zip[name=?]", "student[zip]"
      assert_select "input#student_city[name=?]", "student[city]"
    end
  end
end