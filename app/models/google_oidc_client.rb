# frozen_string_literal: true

class GoogleOidcClient
  ISSUER = 'https://accounts.google.com'

  def initialize
    self.config = OpenIDConnect::Discovery::Provider::Config.discover!(ISSUER)
  end

  def authorization_uri(redirect_uri:, state:)
    client.authorization_uri(redirect_uri:, state:, scope: %w[email])
  end

  def userinfo!(redirect_uri:, code:)
    client.authorization_code = code
    id_token = client.access_token!(redirect_uri:)
    id_token.userinfo!
  end

  private

  def client
    @client ||= OpenIDConnect::Client.new(client_options)
  end

  attr_accessor :config

  def client_options
    {
      identifier: ENV.fetch('OIDC_CLIENT_ID'),
      secret: ENV.fetch('OIDC_CLIENT_SECRET'),
      authorization_endpoint: config.authorization_endpoint,
      token_endpoint: config.token_endpoint,
      userinfo_endpoint: config.userinfo_endpoint
    }
  end
end
