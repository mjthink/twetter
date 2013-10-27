class FollowsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.all_except(current_user)
  end
end
