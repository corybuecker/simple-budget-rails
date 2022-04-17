# frozen_string_literal: true

class FutureValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return record.errors.add(attribute, 'must be a date') unless value.is_a?(Date)

    record.errors.add(attribute, 'must be in the future') unless value.future?
  end
end
