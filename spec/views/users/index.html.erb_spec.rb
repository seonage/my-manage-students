require 'spec_helper'

describe "users/index" do
  before(:each) do
    view.stub!(current_user: User.create(name: 'test', email: 'tttest@tes.com', password: '12341234', password_confirmation: '12341234'))
    assign(:users, [
      stub_model(User,
        :name => "Name",
        :email => "Email"
      ),
      stub_model(User,
        :name => "Name",
        :email => "Email"
      )
    ])
  end

  it "renders a list of users" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "li", :count => 2
  end
end
