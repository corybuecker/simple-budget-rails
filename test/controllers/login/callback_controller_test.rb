# frozen_string_literal: true

require "test_helper"

module Login
  class CallbackControllerTest < ActionDispatch::IntegrationTest
    test "should get new" do
      get login_callback_new_url
      assert_response :success
    end
  end
end
