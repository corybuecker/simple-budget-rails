# frozen_string_literal: true

class ReportsController < ApplicationController
  def show
    render locals: { report: Report.new(user: current_user) }
  end
end
