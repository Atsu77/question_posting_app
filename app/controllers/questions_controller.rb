class QuestionsController < ApplicationController
    include SessionsHelper
    include UsersHelper

    before_action :set_question, only: [:show, :destroy]

    def index
        @questions = Question.page(params[:page]).per(4)
    end

    def show
        @answer = @question.answers
    end

    def new
        @question = Question.new
    end

    def create
        @question = current_user.questions.build(question_params)
        if @question.save
            flash[:notice] = "投稿に成功しました"
            redirect_to questions_url
        else
            flash[:alert] = "投稿に失敗しました"
            render action: :new
        end
    end

    def destroy
        @question.destroy
        redirect_to questions_url
    end
    private

    def question_params
        params.require(:question).permit(:title, :content)
    end

    def set_question
        @question = Question.find(params[:id])
    end
end
