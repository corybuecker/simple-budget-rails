# frozen_string_literal: true

class PreferencesType < ActiveModel::Type::Value
  def cast(value)
    return Preferences.new(value) if value.is_a?(Hash)
    return Preferences.new(ActiveSupport::JSON.decode(value)) if value.is_a?(String)

    value
  end

  def serialize(value)
    ActiveSupport::JSON.encode(value.attributes)
  end

  def changed_in_place?(raw_old_value, new_value)
    ActiveSupport::JSON.decode(raw_old_value) != new_value
  end
end
