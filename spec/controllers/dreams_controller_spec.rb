require "rails_helper"

RSpec.describe DreamsController, type: :controller do
  describe ".index" do
    let(:user) { create(:user, email: "dream_test@example.com") }
    let!(:dream) { create(:dream, user: user) }
    let!(:hidden_dream) { create(:dream, user: user, hidden: true) }

    context "admin logged in" do
      let(:admin) { create(:user, role: :admin) }
      before do
        sign_in(admin)
      end
      it "index all dreams" do
        get :index
        expect(assigns(:dreams)).to include(dream, hidden_dream)
      end
    end

    context "user logged in" do
      before do
        sign_in(user)
      end
      it "index owned hidden dreams" do
        get :index
        expect(assigns(:dreams)).to include(hidden_dream)
        expect(assigns(:dreams)).to include(dream)
      end
    end

    context "other user logged in" do
      let(:other_user) { create(:user, email: "dream_test2@example.com") }
      before do
        sign_in(other_user)
      end
      it "dont index other users hidden dreams" do
        get :index
        expect(assigns(:dreams)).not_to include(hidden_dream)
        expect(assigns(:dreams)).to include(dream)
      end
    end
  end
end
