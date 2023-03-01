class User::PreferencesController < ApplicationController
  def update
    current_user.preferences.assign_attributes(params.require(:preferences).permit(:layout))
    current_user.save!
  end
end
