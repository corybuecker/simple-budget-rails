# frozen_string_literal: true

module Login
  class CallbackController < ApplicationController
    skip_before_action :require_identity
    before_action :validate_state
    before_action :reset_session

    def new
      id_token = TokenExchanger.exchange_code(code: params[:code])

      return head :bad_request unless User.exists?(email: id_token['email'])

      session[:identity] = User.find_by(email: id_token['email']).identity

      redirect_to root_path
    end

    private

    def validate_state
      session_state = session.delete(:state)
      return if session_state.present? && params[:state].present? && session_state == params[:state]

      reset_session
      head :bad_request
    end
  end
end
