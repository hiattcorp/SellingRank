class LeaderboardsController < ApplicationController
  def index
    @tests = Test.all
  end

  def show
    @test = Test.find(params[:id])
    @users = User.have_taken_test(@test.id)
    @attempts = Attempt.where(test_id: @test.id)
  end
end
