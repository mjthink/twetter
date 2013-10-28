require 'spec_helper'

describe TweetsController do
  context "when no user is logged in" do
    describe "GET index" do
      subject { response }

      before { get :index }

      it { should_not be_successful }
    end

    describe "POST create" do
      subject { response }
      before { post :create, :tweet => { :content => "Hello World!" } }

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

    describe "POST create" do
      let(:following) { FactoryGirl.create(:user) }

      before { post :create, :tweet => { :content => "Hello World!" } }

      it "should redirect to GET index" do
        response.should redirect_to tweets_path
      end

      it "should display a success message" do
        flash[:success].should == "Your tweet was shared"
      end

      it "should create a new record" do
        expect {
          post :create, :tweet => { :content => "Hello World!" }
        }.to change { Tweet.count }.by(1)
      end
    end
  end
end
