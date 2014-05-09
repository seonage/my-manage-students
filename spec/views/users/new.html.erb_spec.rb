require 'spec_helper'

describe "users/new" do
  before(:each) do
    view.stub!(current_user: User.create(name: 'test', email: 'tttest@tes.com', password: '12341234', password_confirmation: '12341234'))
    assign(:user, stub_model(User,
      :name => "MyString",
      :email => "MyString"
    ).as_new_record)
  end

  it "renders new user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", users_path, "post" do
      assert_select "input#user_name[name=?]", "user[name]"
      assert_select "input#user_email[name=?]", "user[email]"
    end
  end
end
