class QuestionsController < ApplicationController
  before_action :load_question, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user, except: [:create]

  # GET /questions
  def index
    @questions = Question.all
  end

  # GET /questions/1
  def show
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  def create
    @question = Question.new(question_params)
    @question.author = current_user

    if check_captcha(@question) && QuestionSave.call(@question)
      redirect_to user_path(@question.user), notice: 'Вопрос успешно создан.'
    else
      render :edit
    end
  end

  # PATCH/PUT /questions/1
  def update
    if @question.update(update_params)
      QuestionSave.call(@question)
      redirect_to user_path(@question.user), notice: 'Вопрос успешно отредактирован.'
    else
      render :edit
    end
  end

  # DELETE /questions/1
  def destroy
    user = @question.user
    @question.destroy
    redirect_to user_path(user), notice: 'Вопрос успешно удалён.'
  end

  private

  def load_question
    @question = Question.find(params[:id])
  end

  def authorize_user
    reject_user unless @question.user == current_user
  end

  def question_params
    params.require(:question).permit(:user_id, :text)
  end

  def update_params
    params.require(:question).permit(:answer)
  end

  def check_captcha(model)
    current_user.present? || verify_recaptcha(model: model)
  end
end
