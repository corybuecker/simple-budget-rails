# frozen_string_literal: true

require 'net/http'

class TokenExchanger
  def self.exchange_code(code:, redirect_host:)
    new(code, redirect_host).exchange_code
  end

  def initialize(code, redirect_host)
    self.code = code
    self.redirect_host = redirect_host
  end

  def exchange_code
    id_tokens = JWT.decode JSON.parse(fetch_token(code).body)['id_token'], nil, false
    id_tokens.first
  end

  private

  attr_accessor :code, :redirect_host

  def fetch_token(code)
    Net::HTTP.post_form(
      URI.parse('https://oauth2.googleapis.com/token'), {
        code:,
        client_id: Rails.application.credentials.google.client_id,
        client_secret: Rails.application.credentials.google.client_secret,
        redirect_uri: Rails.application.routes.url_helpers.login_callback_new_url(host: redirect_host),
        grant_type: 'authorization_code'
      }
    )
  end
end
