# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'saves with default preferences' do
    user = User.new(email: 'test@example.com')
    assert(user.save)
    assert(user.reload.preferences.layout == 'automatic')
  end

  test 'validates preferences' do
    user = User.new(email: 'test@example.com', preferences: { layout: :not_valid })
    assert_not(user.valid?)
    assert(user.errors.full_messages.include?('Preferences Layout is not included in the list'))
  end
end
