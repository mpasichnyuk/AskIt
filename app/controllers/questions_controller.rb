class QuestionsController < ApplicationController
  before_action :set_question, only: %i[show destroy edit update]

  def index
    @questions = Question.all
  end

  def show
    @answer = @question.answers.build
  end

  def update_question
    @question_params = Question
  end

  def edit
    # @question = Question.find_by id: params[:id]
  end

  def destroy
    @question = Question.find_by id: params[:id]
    @question.destroy
    redirect_to questions_path
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new question_params
    if @question.save
      flash[:success] = 'Question created!'
      redirect_to questions_path
    else
      render :new
    end
  end

  def update
    # @question = Question.find_by id: params[:id]
    if @question.update question_params
      redirect_to questions_path
    else
      render :edit
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :body)
  end

  def set_question
    @question = Question.find params[:id]
  end
end
