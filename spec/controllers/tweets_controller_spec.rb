require 'spec_helper'

describe TweetsController do
  context "when no user is logged in" do
    describe "GET index" do
      subject { response }

      before { get :index }

      it { should_not be_successful }
    end
  end

  context "when a user is logged in" do
    let(:user) { FactoryGirl.create(:user) }

    before { sign_in user }

    describe "GET index" do
      subject { response }

      before { get :index }

      it { should be_successful }

      it "should assign @tweets" do
        assigns[:tweets].should_not be_nil
      end
    end
  end
end
