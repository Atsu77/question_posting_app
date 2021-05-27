class QuestionsController < ApplicationController
    include SessionsHelper
    include UsersHelper

    def index
        @questions = current_user.questions.page(params[:page]).per(4)
    end

    def new
        @question = Question.new
    end

    def create
        @question = current_user.questions.build(question_params)
        if @question.save
            flash[:notice] = "投稿に成功しました"
            redirect_to questions_path
        else
            flash[:alert] = "投稿に失敗しました"
            render action: :new
        end
    end

    private

    def question_params
        params.require(:question).permit(:title, :content)
    end
end
