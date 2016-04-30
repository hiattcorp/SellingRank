class LeaderboardsController < ApplicationController
  def index
    @tests = Test.all
  end

  def show
    @test = Test.find(params[:id])
    @users = User.includes(:attempts).where(attempts: {test_id: 15}).references(:attempts)
    @attempts = Attempt.where(test_id: @test.id)
  end
end
