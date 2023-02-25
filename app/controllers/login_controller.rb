# frozen_string_literal: true

class LoginController < ApplicationController
  skip_before_action :ensure_authenticated

  def new
    redirect_to OidcClient.new.authorization_uri(redirect_uri: login_callback_new_url, state:), allow_other_host: true
  end

  private

  def state
    session['state'] = SecureRandom.uuid
  end
end
