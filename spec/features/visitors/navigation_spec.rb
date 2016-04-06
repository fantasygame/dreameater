feature "Navigation links", :devise do

  context "user not signed in" do
    before { visit root_path }

    scenario "view signin and signup links" do
      expect(page).to have_content 'Dreameater'
      expect(page).to have_content 'Sign in'
      expect(page).to have_content 'Sign up'
    end

    scenario "doesn't view full navigation" do
      expect(page).not_to have_content 'Dreams'
      expect(page).not_to have_content 'Stalked dreams'
      expect(page).not_to have_content 'My dreams'
      expect(page).not_to have_content 'Top dreams'
      expect(page).not_to have_content 'Edit account'
      expect(page).not_to have_content 'Sign out'
    end
  end

  context "user signed in" do
    before do
      user = FactoryGirl.create(:user, name: 'Dziniu')
      signin(user.email, user.password)
      visit root_path
    end

    scenario "view signed user navigation links" do
      expect(page).to have_content 'Dreameater'
      expect(page).to have_content 'Dreams'
      expect(page).to have_content 'Stalked dreams'
      expect(page).to have_content 'My dreams'
      expect(page).to have_content 'Top dreams'
      expect(page).to have_content 'Dziniu'
      expect(page).to have_content 'Edit account'
      expect(page).to have_content 'Sign out'
    end

    scenario "doesn't view signin and signup" do
      expect(page).not_to have_content 'Sign in'
      expect(page).not_to have_content 'Sign up'
    end
  end
end
