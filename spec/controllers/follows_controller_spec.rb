require 'spec_helper'

describe FollowsController do
  context "when no user is logged in" do
    describe "GET index" do
      subject { response }
      before { get :index }

      it { should_not be_successful }
    end
  end

  context "when a user is logged in" do
    describe "GET index" do
      let(:user) { FactoryGirl.create(:user) }

      subject { response }

      before do
        10.times { FactoryGirl.create(:user) }
        sign_in user
        get :index
      end

      it { should be_successful }

      it "should assign @users to all Users but the logged in one" do
        assigns(:users).map(&:id).should == User.all_except(user).load.map(&:id)
      end
    end
  end
end
