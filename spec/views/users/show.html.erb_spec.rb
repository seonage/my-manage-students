require 'spec_helper'

describe "users/show" do
  before(:each) do
    view.stub!(current_user: User.create(name: 'test', email: 'tttest@tes.com', password: '12341234', password_confirmation: '12341234'))
    @user = assign(:user, stub_model(User,
      :name => "Name",
      :email => "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Email/)
  end
end
