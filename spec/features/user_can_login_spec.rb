require 'rails_helper'

RSpec.feature "A user can login" do
  context "they are a regular user" do
    scenario "they see the user dashboard" do
      user = User.create(name: "Pierre", username: "coolcheffyp", password: "password")

      visit root_path
      click_on "Login"

      expect(page).to have_current_path(new_session_path)
      fill_in "username", with: "coolcheffyp"
      fill_in "password", with: "password"
      click_on "Login"

      expect(page).to have_current_path(dashboard_path)
      expect(page).to have_content "Welcome, Pierre"
    end
  end

  context "they are an admin" do
    scenario "they see the admin dashboard" do
      admin = User.create(name: "Supierre", username: "supercheffyp", password: "password", role: 1)

      visit root_path
      click_on "Login"

      fill_in "username", with: "supercheffyp"
      fill_in "password", with: "password"
      click_on "Login"

      expect(page).to have_current_path(admin_dashboard_path)
      expect(page).to have_content "Admin Dashboard"
    end
  end
end
