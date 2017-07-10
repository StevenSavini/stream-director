require "rails_helper"

feature "user clicks on netflix" do
  before(:each) do
    @user = FactoryGirl.create(:user)
    login_as(@user, scope: :user)

    @wonder_woman = Movie.create(
      title: "Wonder Woman",
      description: "superhero movie", source: "netflix"
    )
  end

  scenario "sees movie on page after clicking netflix" do

    visit netflix_index_path

    expect(current_path).to eq "/netflix"
    expect(page).to have_css("img[src*='http://www.hardwickagriculture.org/blog/wp-content/uploads/placeholder.jpg']")
  end

  scenario "does not see shows unrelated to search" do

    game_of_thrones = Movie.create(
      title: "Batman Vs Superman",
      description: "awesome HBO show", source: "hbo"
    )

    visit netflix_index_path

    expect(current_path).to eq "/netflix"
    expect(page).to_not have_content game_of_thrones.title
  end

end
