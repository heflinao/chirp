require 'spec_helper'

describe User do
  let!(:user) { FactoryGirl.create(:user) }
  let(:follower) { FactoryGirl.create(:user) }
  let(:followed) { FactoryGirl.create(:user) }

  describe "#valid?" do
    let(:user) { User.new }

    before { user.valid? }

    it "requires a username" do
        expect(user).to have(1).errors_on(:username)
    end
  end

  describe ".search" do
    let!(:searched_user) { FactoryGirl.create(:user) }

    it "returns matching users" do
      expect(User.search(searched_user.username)).to include(searched_user)
    end
  end

  describe ".all_but" do
    it "returns all users except specified user" do
      users = User.all_but(user)
      other_user = FactoryGirl.create(:user)

      expect(users).to_not include(user)
      expect(users).to include(other_user)
    end
  end

  context "following" do
    before(:each) do
      FactoryGirl.create(:follow, followed: user, follower: follower)
      FactoryGirl.create(:follow, followed: followed, follower: user)
    end

    context "with followers" do
      it "responds to .followers" do
        expect(user.followers).to include(follower)
      end
    end

    context "who follows" do
      it "responds to .following" do
        expect(user.following).to include(followed)
      end
    end
  end
end

