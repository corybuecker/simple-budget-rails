# frozen_string_literal: true

module Login
  class CallbackController < ApplicationController
    skip_before_action :require_identity

    before_action :validate_state
    before_action :reset_session
    before_action :exchange_code

    def new
      session[:identity] = User.find_by(email: @id_token['email']).identity
      redirect_to root_path
    end

    private

    def validate_state
      session_state = session.delete(:state)
      return if session_state.present? && session_state == params[:state]

      reset_session
      head :bad_request
    end

    def host_for_callback
      return URI.parse('https://budget.corybuecker.com').to_s if Rails.env.production?

      URI.parse(request.host_with_port).to_s
    end

    def exchange_code
      @id_token = TokenExchanger.exchange_code(code: params[:code], redirect_host: host_for_callback)

      head :bad_request unless User.exists?(email: @id_token['email'])
    end
  end
end
