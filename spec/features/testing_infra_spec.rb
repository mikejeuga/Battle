feature "testing_infra" do
  scenario "should render Testing Infrastructure working!" do
    visit("/")
    expect(page).to have_content("Testing Infrastructure working!")
  end
end
