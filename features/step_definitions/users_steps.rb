 Given /^a valid user$/ do
     @users = User.all
end

  When /^they go to the users page$/ do
    visit '/users'
  end

  And /^they press "Add a User!"$/ do
    visit '/signup'
  end

  Then /^they should see the signup page$/ do
    expect(page).to have_content("Sign Up")
  end

  When /^they submit valid signup information$/ do
      @user = User.create
  end
    
  Then /^they should see the new user's name and email address$/ do
    expect(page).to have_title(@user.name)
    expect(page).to have_title(@user.email)
   end 
