# frozen_string_literal: true

module Login
  class CallbackController < ApplicationController
    skip_before_action :redirect_unauthenticated

    before_action :validate_state
    before_action :reset_session
    before_action :require_email_verified
    before_action :require_user_existance

    def new
      session["email"] = identity.email
      redirect_to dashboard_path
    end

    private

    def validate_state
      return if session.delete(:state) == params[:state]
      render status: :unauthorized
    end

    def identity
      @identity ||=
        OidcClient.new.userinfo!(
          redirect_uri: login_callback_new_url,
          code: params["code"]
        )
    end

    def require_email_verified
      render status: :unauthorized unless identity.email_verified
    end

    def require_user_existance
      render status: :unauthorized unless User.exists?(email: identity.email)
    end
  end
end
