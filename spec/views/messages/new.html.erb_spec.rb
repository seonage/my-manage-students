require 'spec_helper'

describe "messages/new" do
  before(:each) do

    @student = FactoryGirl.create :student

    assign(:message, stub_model(Message,
      :student => nil,
      :title => "MyString",
      :content => "MyText"
    ).as_new_record)
  end

  it "renders new message form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", student_messages_path(@student), "post" do
      assert_select "input#message_title[name=?]", "message[title]"
      assert_select "textarea#message_content[name=?]", "message[content]"
    end
  end
end
