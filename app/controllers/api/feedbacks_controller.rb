module Api
  class FeedbacksController < ApplicationController
    def create
      if feedbacks_params.blank?
        response = { 'error' => 'feedback not provided' }
        render json: response, status: :bad_request
      else
        name = feedbacks_params['name']
        comments = feedbacks_params['comments']
        render json: { status: 'success', feedback: {
          name: name, comments: comments
        } }
      end
    rescue ActionController::ParameterMissing
      head :internal_server_error
    end

    private

    def feedbacks_params
      params.require(:feedback).permit(:name, :comments).tap do |feedback_params|
        feedback_params.require(:name) # SAFER
        feedback_params.require(:comments)
      end
    end
  end
end
