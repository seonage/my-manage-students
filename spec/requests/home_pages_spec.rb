require 'spec_helper'

## *** Integration Test Cases for the Home Pages** ###

describe "HomePages" do
  
  ## Test For Home Page ##
  describe "Home page" do
  	# describing the home page
    it "should have the content 'Welcome to Student Database'" do
      # uses Capybara function visit to simulate visiting home page
      visit root_path
    # (page) variable provided by Capybara, to express the expectation
      expect(page).to have_content('Welcome to Student Database')
    end

    it "should have the title 'Home'" do
      visit root_path
      expect(page).to have_title("Home")
    end

  end

  ## Test For Help Page ##
  describe "Help page" do
  	it "should have the content 'Help Page'" do
  		#visit help_path
  		visit help_path
      expect(page).to have_content('Help Page')
  	end

    it "should have the title 'Help'" do
      visit help_path
      expect(page).to have_title("Help")
    end
  end

  ## Test For About Page ##
  describe "About page" do
    it "should have the content 'About Developers'" do
      #visit about_path
      visit about_path
      expect(page).to have_content('About Developers')
  	end

    it "should have the title 'About Developers'" do
      visit about_path
      expect(page).to have_title("About Developers")
    end
  end


end