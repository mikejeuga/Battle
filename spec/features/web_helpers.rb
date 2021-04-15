require "spec_helper"

def sign_in_and_play
  visit("/")
  fill_in "player_1", with: "Player One"
  fill_in "player_2", with: "Player Two"
  click_button "Enter Players"
end
