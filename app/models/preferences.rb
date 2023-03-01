# frozen_string_literal: true

class Preferences
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :layout, :string, default: -> { 'automatic' }
  validates :layout, presence: true, inclusion: { in: %w[automatic grid list] }
end
