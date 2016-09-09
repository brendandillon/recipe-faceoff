require 'rails_helper'

RSpec.feature "Guest creates a user account" do
  scenario "guest sees user dashboard" do
    
    visit root_path
    click_on "New User"
    expect(page).to have_current_path(new_user_path)

    fill_in "user_name", with: "Pierre"
    fill_in "user_username", with: "coolcheffyp"
    fill_in "user_password", with: "password"
    click_on "Create User"

    expect(page).to have_current_path(dashboard_path)
    expect(page).to have_content("Welcome, Pierre")
    expect(page).to have_content("This challenge's ingredients")
  end
end
