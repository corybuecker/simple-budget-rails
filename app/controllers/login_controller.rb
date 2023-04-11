# frozen_string_literal: true

class LoginController < ApplicationController
  skip_before_action :redirect_unauthenticated

  def new
    redirect_to GoogleOidcClient.new.authorization_uri(redirect_uri: login_callback_new_url, state:),
                allow_other_host: true
  end

  private

  def state
    session['state'] = SecureRandom.uuid
  end
end
