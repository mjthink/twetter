class TweetsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @tweets = current_user.all_tweets
  end
end
