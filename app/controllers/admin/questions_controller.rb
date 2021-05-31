class Admin::QuestionsController < ApplicationController
    before_action :if_not_admin

    def index
        @questions = Question.page(params[:page]).per(4)
    end

    private
    def if_not_admin
        redirect_to root_path unless current_user.admin?
    end
end
