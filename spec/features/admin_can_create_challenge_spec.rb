require 'rails_helper'

RSpec.feature "An admin can create a challenge" do
  scenario "they see the new recipe page with their challenge" do
    User.create(name:"supierre", username: "supercheffyp", password: "password", role: 1)

    visit new_session_path
    fill_in "username", with: "supercheffyp"
    fill_in "password", with: "password"
    click_on "Login"

    click_on "New Challenge"
    expect(page).to have_current_path(new_admin_challenge_path)
    fill_in "challenge_theme", with: "bananarama"
    fill_in "challenge_ingredients_attributes_0_name", with: "bananas"
    fill_in "challenge_ingredients_attributes_0_unit", with: "each"
    fill_in "challenge_ingredients_attributes_0_unit_cost", with: "0.5"
    fill_in "challenge_ingredients_attributes_1_name", with: "cinnamon"
    fill_in "challenge_ingredients_attributes_1_unit", with: "tsp"
    fill_in "challenge_ingredients_attributes_1_unit_cost", with: "0.02"
    fill_in "challenge_ingredients_attributes_2_name", with: "flour"
    fill_in "challenge_ingredients_attributes_2_unit", with: "cup"
    fill_in "challenge_ingredients_attributes_2_unit_cost", with: "0.13"
    
    click_on "Create Challenge"

    expect(page).to have_current_path(new_recipe_path)
    expect(page).to have_content("bananas")
    expect(page).to have_content("each")
    expect(page).to have_content("cinnamon")
    expect(page).to have_content("tsp")
    expect(page).to have_content("flour")
    expect(page).to have_content("cup")
  end
end
