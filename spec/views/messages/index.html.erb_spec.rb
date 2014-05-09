require 'spec_helper'

describe "messages/index" do
  before(:each) do
    assign(:student, Student.create(
                                :name => "T-Name",
                                :address => "T-Address",
                                :state => "T-State",
                                :country => "T-Country",
                                :phone => "T-Phone",
                                :zip => "T-Zip",
                                :city => "T-City",
                                :email => "email2@test.com"
    ))

    assign(:messages, [
      stub_model(Message,
        :title => "Title",
        :content => "MyText"
      ),
      stub_model(Message,
        :title => "Title",
        :content => "MyText"
      )
    ])
  end

  it "renders a list of messages" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
