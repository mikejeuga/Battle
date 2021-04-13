feature "testing_infra" do
  scenario "should render welcome message" do
    visit("/")
    expect(page).to have_content("Welcome to Battle!")
  end

  scenario 'players should fill in names' do
    visit("/")
    fill_in 'player_1', with: 'Player One'
    fill_in 'player_2', with: 'Player Two'
    click_button 'Enter Players'
    expect(page).to have_content('Player One Vs Player Two')
  end
end
