# frozen_string_literal: true

class Preferences
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :layout, :string, default: -> { 'list' }
  validates :layout, presence: true, inclusion: { in: %w[grid list] }
end
