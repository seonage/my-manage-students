Feature: Adding a user

  Scenario: Visiting as a logged in user
  Given a valid user
  When they go to the users page
  And they press "Add a User!"
  Then they should see the signup page
  When they submit valid signup information
  Then they should see the new user's name and email address
