require "rails_helper"

feature "visitors can view shows on index page" do
  let!(:first_movie) { FactoryGirl.create(:movie) }
  let!(:user) { FactoryGirl.create(:user) }

  scenario "visitor navigates to movies page" do
    visit root_path

    click_link("Movies")

    expect(page).to have_css("img[src*='http://www.hardwickagriculture.org/blog/wp-content/uploads/placeholder.jpg']")
  end

  scenario "visitor sees all shows displayed" do
    visit movies_path

    expect(page).to have_css("img[src*='http://www.hardwickagriculture.org/blog/wp-content/uploads/placeholder.jpg']")
  end

  scenario "visitor clicks on movie poster" do
    visit movies_path

    click_link("movie-link")

    expect(current_path).to eq movie_path(first_movie)
  end

end
