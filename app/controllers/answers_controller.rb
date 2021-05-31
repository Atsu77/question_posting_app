class AnswersController < ApplicationController
    include SessionsHelper

    def create
        @answer = current_user.answers.build(answer_params).merge(user_id: current_user.id)
        if @answer.save
            flash[:notice] = '回答しました'
            redirect_to question_url(@question)
        else
            flash[:alert] = '回答に失敗しました'
            render template: 'questions/show'
        end
    end

    private
    def answer_params
        params.require(:answer).permit(:content, :question_id)
    end
end
