require 'spec_helper'

###### Integration Test for Users Resource #####
describe "Users pages" do
  
  subject { page }

  let(:authed_admin) { create_logged_in_admin }
  let(:authed_user) { create_logged_in_user }
  ### Test for the Index Page ###
  describe "index" do
    let(:user) { FactoryGirl.create(:user) }

    before do
      visit users_path(authed_admin)
    end

    it { should have_title('All users') }
    it { should have_content('User Accounts') }

    it "should list each user" do
      User.all.each do |user|
        expect(page).to have_selector('li', text: user.name)
      end
    end

    ## List has not admins
    describe "links" do

      describe "as an admin user" do
        before do
          User.create!(name: 'Test', email: 'test2@test.com', password: '12341234', password_confirmation: '12341234', admin: true)
        end

        it { should_not have_link('Delete', href: user_path(User.admins.first)) }
      end
    end
  end

  ### Test for User/Show page ###
  describe "profile page" do
    # Using FactoryGirl to create an Active Record User
    let(:user) {FactoryGirl.create(:user)}
    before {visit user_path(user, authed_admin)}

    it { should have_title(user.name)}
  end

  ## Test for User/New Page ###
  describe "user new page" do
      before { visit new_user_path(authed_admin) }

      it { should have_content('New User') }
      it { should have_title('Sign Up') }
  end


  #### Test for User Sign Up #####
  describe "New user" do

      before { visit new_user_path(authed_admin) }

      let(:submit) { "Create a User" }

      describe "with invalid information" do
        it "should not create a user" do
          expect { click_button submit }.not_to change(User, :count)
        end
      end

      describe "with valid information" do
        before do
          fill_in "Name",         with: "Example User"
          fill_in "Email",        with: "user@example.com"
        end

        it "should create a user" do
          expect { click_button submit }.to change(User, :count).by(1)
        end

        describe "after saving the user" do
          before { click_button submit }
          let(:user) { User.find_by(email: 'user@example.com') }

          it { should have_selector('div.alert.alert-success', text: 'New User Account Created') }
        end
      end
  end

  #### Test for the Edit Page ####
  describe "edit" do
      let(:user) { FactoryGirl.create(:user) }
      before { visit edit_user_path(user, authed_admin) }

      describe "page" do
        #it { should have_content("Update your Profile") }
        it { should have_title("Edit user") }
      end

      describe "with valid information" do
        let(:new_name)  { "New Name" }
        let(:new_email) { "new@example.com" }
        before do
          fill_in "Name",             with: new_name
          fill_in "Email",            with: new_email
          click_button "Save changes"
        end

        it { should have_title(new_name) }
        it { should have_selector('div.alert.alert-success') }
        it { should have_link('Sign Out', href: destroy_user_session_path) }
        specify { expect(user.reload.name).to  eq new_name }
        specify { expect(user.reload.email).to eq new_email }
      end
  end
end
