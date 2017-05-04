feature "user logs out of account" do

  before(:each) do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)  end

  scenario "sees and clicks on log out button from any page" do
    visit movies_path

    click_link "out"

    expect(current_path).to eq '/'
    expect(page).to have_content("Sign in")
    expect(page).to have_content("Create Account")
  end
end
