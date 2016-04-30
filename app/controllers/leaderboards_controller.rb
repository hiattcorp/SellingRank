class LeaderboardsController < ApplicationController
  def index
    @tests = Test.all
  end

  def show
    @test_id = params[:id]
    @users = User.all
  end
end
