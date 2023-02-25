# frozen_string_literal: true

module Login
  class CallbackController < ApplicationController
    skip_before_action :ensure_authenticated

    before_action :validate_state
    before_action :reset_session
    before_action :require_email_verified
    before_action :require_user_existance

    def new
      session['email'] = identity.email
      redirect_to dashboard_index_path
    end

    private

    def validate_state; end

    def identity
      @identity ||= OidcClient.new.userinfo!(redirect_uri: login_callback_new_url, code: params['code'])
    end

    def require_email_verified
      render status: :unauthorized unless identity.email_verified
    end

    def require_user_existance
      render status: :unauthorized unless User.where(email: identity.email).exists?
    end
  end
end
