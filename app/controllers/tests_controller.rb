class TestsController < ApplicationController
  load_and_authorize_resource
  
  before_action :set_test, only: [:show, :edit, :update, :destroy, :take, :submit_test]
  before_action :set_options, only: [:show, :take]

  # GET /tests
  # GET /tests.json
  def index
    @tests = Test.all
  end

  # GET /tests/1
  # GET /tests/1.json
  def show
  end

  # GET /tests/new
  def new
    @test = Test.new
    1.times do
      question = @test.questions.build
      1.times { question.options.build }
    end
  end

  # GET /tests/1/edit
  def edit
   @test = Test.find(params[:id])
    end

  # POST /tests
  # POST /tests.json
  def create
    @test = Test.new(test_params)

    respond_to do |format|
      if @test.save
        format.html { redirect_to @test, notice: 'Test was successfully created.' }
        format.json { render :show, status: :created, location: @test }
      else
        format.html { render :new }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tests/1
  # PATCH/PUT /tests/1.json
  def update
    respond_to do |format|
      if @test.update(test_params)
        format.html { redirect_to @test, notice: 'Test was successfully updated.' }
        format.json { render :show, status: :ok, location: @test }
      else
        format.html { render :edit }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tests/1
  # DELETE /tests/1.json
  def destroy
    @test.destroy
    respond_to do |format|
      format.html { redirect_to tests_url, notice: 'Test was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def take
  end

  def submit_test
    @score = 0
    params[:test][:questions_attributes].each do |k, v|
      @score += v[:options].reduce(:+).to_i
    end
    Attempt.create(user_id: current_user.id, test_id: @test.id, score: @score)
    UserMailer.email_test_score(current_user, @test.id, @score).deliver if current_user.test_notifications_enabled?
    respond_to do |format|
      format.html { redirect_to tests_url, notice: 'Test submitted successfully' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_test
    @test = Test.find(params[:id])
  end

  def set_options
    @options = []
    @test.questions.each do |question|
      question.options.each do |option|
        @options << option
      end
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def test_params
    params.require(:test).permit(:name, questions_attributes: [:id, :test_id, :content, :_destroy,
      options_attributes: [:id, :question_id, :answer, :points, :_destroy]])
  end
end
