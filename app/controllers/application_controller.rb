# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :redirect_unauthenticated

  private

  def redirect_unauthenticated
    redirect_to login_new_path unless authenticated?
  end

  def authenticated?
    current_user.present?
  end

  def current_user
    @current_user ||= User.find_by(email: session["email"])
  end
end
