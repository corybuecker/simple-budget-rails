# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include ActionView::RecordIdentifier
  before_action :require_identity

  def render_flash_error(error)
    flash.now[:error] = error
    render turbo_stream: turbo_stream.update('flash', partial: 'shared/flash')
  end

  private

  def require_identity
    redirect_to login_new_path unless User.exists?(identity: session[:identity])
  end
end
