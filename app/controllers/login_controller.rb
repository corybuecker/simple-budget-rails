# frozen_string_literal: true

class LoginController < ApplicationController
  skip_before_action :require_identity
  before_action :reset_session

  def new
    session[:state] = SecureRandom.uuid
    redirect_to redirect_uri, allow_other_host: true
  end

  private

  def redirect_uri
    URI.parse('https://accounts.google.com/o/oauth2/v2/auth').tap do |uri|
      uri.query = URI.encode_www_form([
                                        %w[response_type code],
                                        ['client_id', Rails.application.credentials.google.client_id],
                                        ['scope', 'openid email'],
                                        ['redirect_uri',
                                         Rails.application.routes.url_helpers.login_callback_new_url(host: 'http://localhost:3000')],
                                        ['state', session[:state]]
                                      ])
    end.to_s
  end
end
