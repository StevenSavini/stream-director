require 'rails_helper'

# Acceptance Criteria
# [ ] I want to see a link to log in from the index page
# [ ] I want fields to enter my log in information
# [ ] Once I have entered my information, I want to click the log in button and
#     be signed in to the home page

feature "user signs in" do
  let(:user) { FactoryGirl.create(:user) }

  scenario "sees and clicks on Sign In button from main page" do
    visit movies_path

    click_link "Sign in"

    expect(page).to have_content("Log in")
    expect(current_path).to eq '/users/sign_in'
  end

  scenario "fills in account details with email and password and submits
            details" do
    visit new_user_session_path

    fill_in('Email', with: user.email)
    fill_in('Password', with: user.password)

    click_button "Log in"

    expect(current_path).to eq '/'
    expect(page).to_not have_content("Sign in")
    expect(page).to_not have_content("Create Account")
  end

  scenario "fills in bad details in form and submits details" do
    visit new_user_session_path

    click_button "Log in"

    expect(page).to have_content "Invalid Email or password."
  end

  scenario "fills in mismatched details" do
    visit new_user_session_path

    fill_in('Email', with: user.email)
    fill_in('Password', with: 'thisisnotmypassword')

    click_button "Log in"

    expect(page).to have_content "Invalid Email or password."
  end

end
