class AnswersController < ApplicationController
    include SessionsHelper

    def create
        @answer = current_user.answers.build(answer_params)
        if @answer.save
            flash[:notice] = '回答しました'
            redirect_to question_url(@answer.question)
        else
            flash[:alert] = '回答に失敗しました'
            render template: 'questions/show'
        end
    end

    private
    def answer_params
        params.permit(:question_id, :content)
    end
end
