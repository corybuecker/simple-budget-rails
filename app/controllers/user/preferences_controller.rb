class User::PreferencesController < ApplicationController
  def update
    current_user.preferences.assign_attributes(params.require(:preferences).permit(:layout))
    current_user.save!

    render locals: { current_user:, collection: params[:preferences][:collection] }
  end
end
