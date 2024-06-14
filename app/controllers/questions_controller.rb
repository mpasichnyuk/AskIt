# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :set_question, only: %i[show destroy edit update]

  def index
    @questions = Question.order(created_at: :desc).page params[:page]
  end

  def show
    @answer = @question.answers.build
    @answers = @question.answers.order created_at: :desc
  end

  def update_question
    @question_params = Question
  end

  def new
    @question = Question.new
  end

  def edit
    # @question = Question.find_by id: params[:id]
  end

  def create
    @question = Question.new question_params
    @question.user = current_user
    if @question.save
      flash[:success] = 'Question created!'
      redirect_to questions_path
    else
      error_messages = @question.errors.full_messages.join(', ')
      flash.now[:warning] = "Error: #{error_messages}"
      render :new
    end
  end

  def update
    @question = Question.find_by id: params[:id]
    if @question.update question_params
      redirect_to questions_path
    else
      render :edit
    end
  end

  def destroy
    @question = Question.find_by id: params[:id]
    @question.destroy
    redirect_to questions_path
  end

  private

  def question_params
    params.require(:question).permit(:title, :body)
  end

  def set_question
    @question = Question.find params[:id]
  end
end
