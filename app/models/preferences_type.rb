# frozen_string_literal: true

class PreferencesType < ActiveModel::Type::Value
  include ActiveModel::Type::Helpers::Mutable

  def deserialize(value)
    Preferences.new(value.is_a?(String) ? ActiveSupport::JSON.decode(value) : value)
  end

  def serialize(value)
    ActiveSupport::JSON.encode(value)
  end
end
