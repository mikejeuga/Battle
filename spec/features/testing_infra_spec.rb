require_relative "web_helpers"

feature "testing_infra" do
  scenario "should render welcome message" do
    visit("/")
    expect(page).to have_content("Welcome to Battle!")
  end

  scenario "players should fill in names" do
    sign_in_and_play
    expect(page).to have_content("Player One Vs Player Two")
  end
end

feature "View hit points" do
  scenario "I want to see Player 2 hit points" do
    sign_in_and_play
    expect(page).to have_content("Player Two: 60HP")
  end
end

feature "Attack a player" do
  scenario "Attack player 2" do
    sign_in_and_play
    click_button "Attack"
    expect(page).to have_text("Player One has attacked Player Two")
  end

  scenario "a player is being attacked" do
    sign_in_and_play
    click_button "Attack"
    expect(page).to have_text("Player Two: 50HP")
  end
end

feature "switching turns" do
  scenario "start of the game" do
    sign_in_and_play
    expect(page).to have_text("Player One's turn")
  end

  scenario "after player one attacks" do
    sign_in_and_play
    click_button "Attack"
    click_link 'test'
    expect(page).not_to have_text("Player One's turn")
    expect(page).to have_text("Player Two's turn")
  end
end
