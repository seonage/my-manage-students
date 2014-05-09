require 'spec_helper'

describe "students/index" do
  before(:each) do

    Student.create!(:name => "T-Name",
                   :address => "T-Address",
                   :state => "T-State",
                   :country => "T-Country",
                   :phone => "T-Phone",
                   :zip => "T-Zip",
                   :city => "T-City",
                   :email => "email2@test.com")

    Student.create!(:name => "T-Name",
                   :address => "T-Address",
                   :state => "T-State",
                   :country => "T-Country",
                   :phone => "T-Phone",
                   :zip => "T-Zip",
                   :city => "T-City",
                   :email => "email1@test.com")

    assign(:search, Student.search(params[:q]))
    @search = Student.search(params[:q])
    assign(:students, @search.result(:distinct => true))
  end

  it "renders a list of students" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "T-Name".to_s, :count => 2
    assert_select "tr>td", :text => "T-Address".to_s, :count => 2
    assert_select "tr>td", :text => "T-State".to_s, :count => 2
    assert_select "tr>td", :text => "T-Country".to_s, :count => 2
    assert_select "tr>td", :text => "T-Phone".to_s, :count => 2
    assert_select "tr>td", :text => "T-Zip".to_s, :count => 2
    assert_select "tr>td", :text => "T-City".to_s, :count => 2

  end
end