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
      subject { response }
      before do
        sign_in FactoryGirl.create(:user)
        get :index
      end

      it { should be_successful }
    end
  end
end
