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
    @current_user ||= User.find_by(email: ENV.fetch('DEMO_MODE') == '1' ? 'test@example.com' : session['email'])
  end

  def locals_with_current_user(extras)
    { locals: { current_user: }.merge(extras) }
  end
end
